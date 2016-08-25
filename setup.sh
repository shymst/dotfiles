#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -s $HOME/dotfiles/$f $HOME/$f
done

if ! type brew > /dev/null 2>&1; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! type git > /dev/null 2>&1; then
    brew install git
fi

if ! type vim > /dev/null 2>&1; then
    brew install vim
fi

if ! type git-flow > /dev/null 2>&1; then
    brew install git-flow
fi

if ! type hub > /dev/null 2>&1; then
    brew install hub
fi

bundle install

