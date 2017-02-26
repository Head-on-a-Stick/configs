if [ -z "$TMUX" ]; then
	ID="$(tmux ls 2>/dev/null | awk -F':' '!/attached/{print $1}' | sed q)"
	if [ -z "$ID" ]; then
		tmux new-session
	else
		tmux attach-session -t "$ID"
	fi
fi

alias su='/bin/su'
alias passwd='/usr/bin/passwd'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias ls='ls --color'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias sluf='systemctl list-unit-files --state=enabled'

case "$0" in
        mksh*|ksh93)
                PS1=$'${HOSTNAME:=$(hostname)}: \$PWD \1\e[31m\1${?#0}\1\e[0m\1\$ ';;
        *)
                PS1='\h: \w \[\033[01;31m\]${?#0}\[\033[00m\]\$ '
esac
