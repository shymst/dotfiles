#!/bin/bash

DOT_DIRECTORY="${HOME}/dotfiles"

# Homebrewの環境構築
source ${DOT_DIRECTORY}/bin/brew
run_brew

# Zshをデフォルトシェルに設定
[ ${SHELL} != "/usr/local/bin/zsh"  ] && chsh -s /usr/local/bin/zsh
echo "$(tput setaf 2)Initialize complete!. ✔︎$(tput sgr0)"

# zpluginをインストール
[ ! -d ${HOME}/.zplugin ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# anyenvをインストール
if [ -f "~/.anyenv" ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  exec $SHELL -l
  anyenv install rbenv
fi
