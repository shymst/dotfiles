export EDITOR=nvim
export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8
export KCODE=u
export AUTOFEATURE=true
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export TERM=screen-256color
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"

# Homebrew
if [[ -x '/usr/local/bin/brew' ]]
then
  HOMEBREW_PREFIX='/usr/local'
  export HOMEBREW_PREFIX
  path=( "${HOMEBREW_PREFIX}/bin" "${path[@]}" )

  export XDG_DATA_DIRS="${HOMEBREW_PREFIX}/share:${XDG_DATA_DIRS}"
fi

# anyenv
if [[ -d "${HOME}/.anyenv" ]]
then
  export ANYENV_ROOT="${HOME}/.anyenv"
  path=( "${ANYENV_ROOT}/bin" "${path[@]}" )
fi
