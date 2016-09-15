#!/bin/bash

DOTPATH=~/.dotfiles

# git が使えるなら git
if has "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif has "curl" || has "wget"; then
    tarball="https://github.com/shymst/dotfiles/archive/master.tar.gz"

    # どっちかでダウンロードして，tar に流す
    if has "curl"; then
        curl -L "$tarball"

    elif has "wget"; then
        wget -O - "$tarball"

    fi | tar xv -

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    die "curl or wget required"
fi

cd ~/.dotfiles
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

# リンクを実行する
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

mas install 539883307  # LINE
mas install 921923693  # LibreOffice Vanilla
mas install 1037994372 # DrCleanerPro
mas install 409183694  # Keynote
mas install 406056744  # Evernote
mas install 441258766  # Magnet
mas install 485812721  # TweetDeck
mas install 425424353  # The Unarchiver
mas install 411246225  # Caffeine
mas install 425955336  # Skitch
mas install 668208984  # GIPHY CAPTURE
mas install 443987910  # 1Password
mas install 409203825  # Numbers
mas install 497799835  # Xcode
mas install 409201541  # Pages
mas install 1024640650 # CotEditor
mas install 803453959  # Slack
mas install 1007457278 # Realm Browser
mas install 1000397973 # Wallcat
mas install 568494494  # Pocket
