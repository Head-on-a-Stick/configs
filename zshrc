if [[ -z "$TMUX" ]] ;then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`"
    if [[ -z "$ID" ]] ;then
        tmux new-session
    else
        tmux attach-session -t "$ID"
    fi
fi
alias nm='/usr/bin/sudo systemctl stop wpa_supplicant@wlp2s0 && /usr/bin/sudo ip a flush wlp2s0 && /usr/bin/sudo systemctl start NetworkManager && nm-applet &'
alias unm='/usr/bin/sudo systemctl stop NetworkManager && killall nm-applet && /usr/bin/sudo ip a flush wlp2s0 && /usr/bin/sudo systemctl start wpa_supplicant@wlp2s0'
alias sudo='/usr/bin/sudo'
alias su='/usr/bin/su'
alias passwd='/usr/bin/passwd'
alias spawn='sudo systemd-nspawn -bD /jessie'
light(){xbacklight -set $1}
colourtable() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
export EDITOR=vim
export SYSTEMD_EDITOR=vim
export VISUAL=vim
export BROWSER=firefox
export SUDO_EDITOR=rvim
