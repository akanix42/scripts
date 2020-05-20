# pyenv / pyenv-virtualenv
if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
  pyenv shell 3.8.2
fi

function venv() {
  pyenv virtualenv "$(basename ${PWD})" || echo
  pyenv shell "$(basename ${PWD})"
}
