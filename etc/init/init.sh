#!/bin/bash

if ! type brew > /dev/null 2>&1; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
fi

brew install git
brew install git-flow
brew install hub
brew install vim

brew install zsh
brew install tmux
brew install zplug
brew install bash-comletion
brew install zsh-completions
brew install argon/mas/mas

brew install carthage
brew install cocoapods

# brew cask install vagrant
# brew cask install virtualbox
# brew cask install atom
# brew cask install google-chrome
#
#
# mas install 539883307  # LINE
# mas install 921923693  # LibreOffice Vanilla
# mas install 1037994372 # DrCleanerPro
# mas install 409183694  # Keynote
# mas install 406056744  # Evernote
# mas install 441258766  # Magnet
# mas install 485812721  # TweetDeck
# mas install 425424353  # The Unarchiver
# mas install 411246225  # Caffeine
# mas install 425955336  # Skitch
# mas install 668208984  # GIPHY CAPTURE
# mas install 443987910  # 1Password
# mas install 409203825  # Numbers
# mas install 497799835  # Xcode
# mas install 409201541  # Pages
# mas install 1024640650 # CotEditor
# mas install 803453959  # Slack
# mas install 1007457278 # Realm Browser
# mas install 1000397973 # Wallcat
# mas install 568494494  # Pocket


# Assign zsh as a login shell
if ! contains "${SHELL:-}" "zsh"; then
  zsh_path="$(which zsh)"

  # Check /etc/shells
  if ! grep -xq "${zsh_path:=/bin/zsh}" /etc/shells; then
    log_fail "oh, you should append '$zsh_path' to /etc/shells"
    exit 1
  fi

  if [ -x "$zsh_path" ]; then
    # Changing for a general user
    if chsh -s "$zsh_path" "${USER:-root}"; then
      log_pass "Change shell to $zsh_path for ${USER:-root} successfully"
    else
      log_fail "cannot set '$path' as \$SHELL"
      log_fail "Is '$path' described in /etc/shells?"
      log_fail "you should run 'chsh -l' now"
      exit 1
    fi

    # For root user
    if [ ${EUID:-${UID}} = 0 ]; then
      if chsh -s "$zsh_path" && :; then
        log_pass "[root] change shell to $zsh_path successfully"
      fi
    fi
  else
    log_fail "$zsh_path: invalid path"
    exit 1
  fi
fi


# Install zplug
if [[ ! -f ~/.zplug/init.zsh ]]; then
  if (( ! $+commands[git] )); then
    echo "git: command not found" >&2
    exit 1
  fi

  git clone \
  https://github.com/zplug/zplug \
  ~/.zplug

  # failed
  if (( $status != 0 )); then
    echo "zplug: fails to installation of zplug" >&2
  fi
fi

if [[ -f ~/.zplug/init.zsh ]]; then
  echo "zplug: not found" >&2
  exit 1
fi
# load zplug
source ~/.zplug/init.zsh

if [[ -f $DOTPATH/.zsh/zplug.zsh ]]; then
  export ZPLUG_LOADFILE="$DOTPATH/.zsh/zplug.zsh"
fi

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi
zplug load --verbose
