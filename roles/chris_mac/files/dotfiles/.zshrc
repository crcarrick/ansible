# oh-my-sh & p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  asdf 
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
  export EDITOR='code --wait'
fi

# custom functions & aliases
source $HOME/.zsh_funcs
source $HOME/.zsh_aliases

# anything extra (eg. bitwarden-cli session)
source $HOME/.zsh_extra

# configure less
export LESS='--chop-long-lines --HILITE-UNREAD --ignore-case --incsearch --jump-target=4 --LONG-PROMPT --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --status-line --use-color --window=-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# extend path
export PATH=$HOME/.cargo/bin:$PATH

# plugins from homebrew
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  # must be first
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# codex cli
export CODEX_CLI_PATH=$HOME/.codex-cli
source "$CODEX_CLI_PATH/scripts/zsh_plugin.zsh"
bindkey '^G' create_completion
