#!/bin/bash

DOT_DIRECTORY="${HOME}/dotfiles"

source ${DOT_DIRECTORY}/bin/brew

if [ -f "~/.anyenv" ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  exec $SHELL -l
  anyenv install rbenv
fi

run_brew

[ ! -d ${HOME}/.zplugin ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
[ ! -d ${HOME}/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

[ ${SHELL} != "/bin/zsh"  ] && chsh -s /bin/zsh
echo "$(tput setaf 2)Initialize complete!. ✔︎$(tput sgr0)"
