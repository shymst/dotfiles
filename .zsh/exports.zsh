#!/usr/bin/env zsh

# Homebrew/Linuxbrew

if [[ -d "${HOME}/.linuxbrew" ]]
then
  HOMEBREW_PREFIX="${HOME}/.linuxbrew"
elif [[ -x '/usr/local/bin/brew' ]]
then
  HOMEBREW_PREFIX='/usr/local'
fi

if [[ -n "$HOMEBREW_PREFIX" ]]
then
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

if [[ -d "${HOME}/.zsh" ]]
then
  fpath=(
    "${HOME}/.zsh/completions"
    "${HOME}/.zsh/functions"
    "${fpath[@]}"
  )
  export FPATH
fi

export XDG_CONFIG_HOME="${HOME}/.config"

# vi: et sw=2 cc=80
