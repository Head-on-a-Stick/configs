if [ "$TERM" = "linux" ]; then
    printf "\e]P0000000" # color0
    printf "\e]P1cc0000" # color1
    printf "\e]P24e9a06" # color2
    printf "\e]P3c4a000" # color3
    printf "\e]P43465a4" # color4
    printf "\e]P575507b" # color5
    printf "\e]P606989a" # color6
    printf "\e]P7d3d7cf" # color7
    printf "\e]P8555753" # color8
    printf "\e]P9ef4129" # color9
    printf "\e]PA8ae234" # color10
    printf "\e]PBfce94f" # color11
    printf "\e]PC729fcf" # color12
    printf "\e]PDad7fa8" # color13
    printf "\e]PE34e2e2" # color14
    printf "\e]PFedeeec" # color15
#   clear # removes artefacts but also removes /etc/{issue,motd}
fi
