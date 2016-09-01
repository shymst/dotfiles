#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -s $HOME/dotfiles/$f $HOME/$f
done


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

brew cask install vagrant
brew cask install virtualbox
brew cask install atom
brew cask install google-chrome

mas install 497799835 # Xcode
539883307 LINE
921923693 LibreOffice Vanilla
406056744 Evernote
485812721 TweetDeck
425424353 The Unarchiver
411246225 Caffeine
425955336 Skitch
1024640650 CotEditor
803453959 Slack
1007457278 Realm Browser
568494494 Pocket
