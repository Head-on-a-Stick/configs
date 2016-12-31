if [[ -z "$TMUX" ]]; then
	ID="$(tmux ls 2>/dev/null | awk -F':' '!/attached/{print $1}' | sed q)"
	if [[ -z "$ID" ]]; then
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
alias ps-mem='su -c "ps-mem"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
set -o emacs

PS1='\h: \w \[\033[01;31m\]${?#0}\[\033[00m\]\$ '
