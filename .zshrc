zmodload zsh/zpty

# プラグインが使うコマンドをautoloadする
autoload -Uz add-zsh-hook \
    cdr \
    chpwd_recent_dirs \
    compinit \
    _zplugin

# Load zplugin
. "${HOME}/.zplugin/bin/zplugin.zsh"

if [[ "${+_comps}" == 1 ]]; then
  _comps[zplugin]=_zplugin
fi

# anyenv がコマンドとして実行可能であれば anyenv を初期化します。
if [[ "${+commands[anyenv]}" == 1 ]]
then
  eval "$(anyenv init - zsh)"
fi

zplugin snippet "${HOME}/.zsh/30_aliases.zsh"
zplugin snippet "${HOME}/.zsh/40_prompt.zsh"
zplugin snippet "${HOME}/.zsh/50_setopt.zsh"

# ===== zplugin > Utilities =====

# OS間のクリップボードの差異を吸収するコマンドを定義する oh-my-zsh のスニペットをロードします。
zplugin snippet 'OMZ::lib/clipboard.zsh'

# fzf を利用した補完のキーバインドを設定するスニペットをロードします。
# Homebrew で fzf がインストールされている、かつ HOMEBREW_PREFIX に Homebrew のプリフィックスが格納されていることが前提です。
zplugin snippet "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.zsh"

# zsh の補完を使いやすく設定する oh-my-zsh のスニペットをロードします。
zplugin snippet 'OMZ::lib/completion.zsh'
zplugin snippet 'OMZ::lib/compfix.zsh'


# ===== zplugin > Plugins =====

# 利用可能なエイリアスを使わずにコマンドを実行した際に通知するプラグインです。
export ZSH_PLUGINS_ALIAS_TIPS_TEXT='alias-tips: '
zplugin light 'djui/alias-tips'

# fzf を使ったウィジェットが複数バンドルされたプラグインです。
zplugin light 'mollifier/anyframe'

# 作業中のGitのルートディレクトリまでジャンプするコマンドを定義するプラグインです。
# cd-gitroot コマンドをエイリアスで U に割り当てています。
zplugin light 'mollifier/cd-gitroot'

# ls よりも使いやすく見やすいディレクトリの一覧表示のコマンドを定義するプラグインです。
zplugin ice pick'k.sh'
zplugin light 'supercrabtree/k'

# 作業ディレクトリに .env ファイルがあった場合に自動的にロードしてくれます。
zplugin snippet 'OMZ::plugins/dotenv/dotenv.plugin.zsh'

# コマンド入力待ち状態から control-Z で suspend したプロセスに復帰するキーバインドを設定するプラグインです。
zplugin snippet 'OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh'

# Gitの補完と大量のエイリアスを定義するプラグインです。
# エイリアスは重宝するものが多く、Gitを使うユーザーには必ずオススメしたいプラグインです。
zplugin snippet 'OMZ::plugins/git/git.plugin.zsh'

# .zshrc を zcompile してロードしてくれる src コマンドを定義するプラグインです。
zplugin snippet 'OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh'
# }}}


# ===== zplugin > Completions =====

# プラグインの中に含まれているコマンド補完のみを zplugin で管理します。
# 想定された zplugin の使い方ではないかもしれません。
zplugin ice pick''
zplugin light 'jsforce/jsforce-zsh-completions'
zplugin ice pick''
zplugin light 'zsh-users/zsh-completions'

compinit
zplugin cdreplay -q


# ===== zplugin > Plugins loaded after compinit =====

# コマンドをハイライトするプラグインを遅延ロードします。
zplugin light 'zdharma/fast-syntax-highlighting'
# コマンドをサジェストするプラグインを遅延ロードします。
zplugin light 'zsh-users/zsh-autosuggestions'
