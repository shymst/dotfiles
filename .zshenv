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

# History
# History file
export HISTFILE=~/.zsh_history
# History size in memory
export HISTSIZE=10000
# The number of histsize
export SAVEHIST=1000000
# The size of asking history
export LISTMAX=50
# Do not add in root
if [[ $UID == 0 ]]; then
    unset HISTFILE
    export SAVEHIST=0
fi

# ls command colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
