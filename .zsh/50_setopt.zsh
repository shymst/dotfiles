
###########################
#        Options
###########################
# 環境変数
export LANG=ja_JP.UTF-8

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# コマンドのスペルを訂正
setopt correct

# beep を無効にする
setopt no_beep

# 直前のコマンドの重複を削除
setopt hist_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 同時に起動したzshの間でヒストリを共有
setopt share_history

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完候補を詰めて表示
setopt list_packed

# 補完候補一覧をカラー表示
zstyle ':completion:*' list-colors ''

# C で標準出力をクリップボードにコピーする
if which pbcopy >/dev/null 2>&1 ; then
    alias -g C='| pbcopy'
fi

for d in "/share/zsh-completions" "/share/zsh/zsh-site-functions" "/share/zsh/site-functions";do
  brew_completion=$(brew --prefix 2>/dev/null)$d
  if [ $? -eq 0 ] && [ -d "$brew_completion" ];then
    fpath=($brew_completion $fpath)
  fi
done
autoload -Uz compinit
compinit -D


