if [[ -z "$TMUX" ]]; then
	ID="$(tmux ls 2>/dev/null | awk -F':' '!/attached/{print $1}' | uniq)"
	if [[ -z "$ID" ]]; then
		tmux new-session
	else
		tmux attach-session -t "$ID"
	fi
fi
alias sudo='/usr/bin/sudo'
alias su='/bin/su'
alias passwd='/usr/bin/passwd'
alias cp='cp -iv'
alias mv='mv -iv'
alias ls='ls --color'
set -o emacs
