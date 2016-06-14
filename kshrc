if [[ -z "$TMUX" ]]; then
	ID="`tmux ls | awk -F':' '!/attached/{print $1}' | head -n1`"
	if [[ -z "$ID" ]]; then
		tmux new-session
	else
		tmux attach-session -t "$ID"
	fi
fi
