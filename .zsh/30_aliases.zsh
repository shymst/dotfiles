########################################
##              Alias
########################################

alias ls='ls -GAF'
alias ll='ls -l'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

alias vim="split_vim $1"


split_vim() {
    tmux has-session &> /dev/null
    if [ $? = 0 ];
    then
        tmux split-window -h -p 70 "vim $1"
    else
        vim $1
    fi
}
