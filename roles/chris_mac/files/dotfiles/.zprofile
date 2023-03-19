# brew
if [[ $(uname -m) == 'arm64' ]]; then
  # m1
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  # intel
  eval "$(/usr/local/bin/brew shellenv)"
fi


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"