# oh-my-sh & p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  vscode 
  web-search 
  yarn 
  z 
)

# disable warning
ZSH_DISABLE_COMPFIX="true"

source $ZSH/oh-my-zsh.sh

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# autocorrect
ENABLE_CORRECTION="true"
unsetopt CORRECT_ALL

# do not overwrite existing files with > and >>
# use >! and >>! to bypass
unsetopt CLOBBER

# iTerm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# zsh-completions
[[ -s $(brew --prefix)/share/zsh-completions ]] && fpath=($(brew --prefix)/share/zsh-completions $fpath)
compinit -u

# set editor for SSH and local sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=nano
else
  export EDITOR=vi
fi

# custom functions & aliases
source $HOME/.zsh_funcs
source $HOME/.zsh_aliases

# anything extra (eg. bitwarden-cli session)
source $HOME/.zsh_extra

# configure less
export LESS='--chop-long-lines --HILITE-UNREAD --ignore-case --incsearch --jump-target=4 --LONG-PROMPT --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --use-color --window=-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

export LESS_TERMCAP_mb=$'\E[01;31m'      # begins blinking
export LESS_TERMCAP_md=$'\E[01;31m'      # begins bold
export LESS_TERMCAP_me=$'\E[0m'          # ends mode
export LESS_TERMCAP_se=$'\E[0m'          # ends standout-mode
export LESS_TERMCAP_so=$'\E[00;47;30m'   # begins standout-mode
export LESS_TERMCAP_ue=$'\E[0m'          # ends underline
export LESS_TERMCAP_us=$'\E[01;32m'      # begins underline

export PAGER=less

# extend path
export PNPM_HOME="$HOME/Library/pnpm"

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.docker/bin:$PATH
export PATH=$PNPM_HOME:$PATH

# plugins from homebrew
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # must be first
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fuzzy finder
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# copilot 
eval "$(github-copilot-cli alias -- "$0")"

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion
