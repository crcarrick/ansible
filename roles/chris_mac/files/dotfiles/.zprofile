# brew
if [[ $(uname -m) == 'arm64' ]]; then
  # apple silicon
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  # intel
  eval "$(/usr/local/bin/brew shellenv)"
fi


# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
fi

# direnv
if command -v direnv 1>/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
