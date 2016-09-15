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
