bindkey -e

setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt correct
setopt magic_equal_subst
setopt prompt_subst                                         # PROMPT変数内で変数参照する
setopt notify
setopt equals

### Complement ###
autoload -U compinit; compinit
setopt auto_list                                            # 補完候補を一覧で表示する(d)
setopt auto_menu                                            # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed
setopt list_types
bindkey "^[[Z" reverse-menu-complete                        # Shift-Tabで補完候補を逆順する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

### Glob ###
setopt extended_glob
unsetopt caseglob

### History ###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist                                            # !を使ったヒストリ展開を行う(d)
setopt extended_history
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
function history-all { history -E 1 }
