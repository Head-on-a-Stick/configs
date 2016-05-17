if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`"
    if [[ -z "$ID" ]] ;then
        tmux new-session
    else
        tmux attach-session -t "$ID"
    fi
fi
alias sudo='/usr/bin/sudo'
alias su='/usr/bin/su'
alias passwd='/usr/bin/passwd'
alias cp='cp -iv'
alias mv='mv -iv'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
light(){xbacklight -set $1}
