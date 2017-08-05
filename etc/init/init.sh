#!/bin/bash

DOT_DIRECTORY="${HOME}/dotfiles"

source ${DOT_DIRECTORY}/bin/brew

if [ -f "~/.anyenv" ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  exec $SHELL -l
  anyenv install rbenv
fi

run_brew

[ ${SHELL} != "/bin/zsh"  ] && chsh -s /bin/zsh
echo "$(tput setaf 2)Initialize complete!. ✔︎$(tput sgr0)"
