if [ "$TERM" = "linux" ]; then
    printf "\e]PBfff796" # S_base00
    printf "\e]PAc5f779" # S_base01
    printf "\e]P0000000" # S_base02
    printf "\e]P6418179" # S_cyan
    printf "\e]P8888888" # S_base03
    printf "\e]P2aece92" # S_green
    printf "\e]P5963c59" # S_magenta
    printf "\e]P19e1828" # S_red
    printf "\e]PC4186be" # S_base0
    printf "\e]PE71bebe" # S_base1
    printf "\e]P9cf6171" # S_orange
    printf "\e]P7bebebe" # S_base2
    printf "\e]P4414171" # S_blue
    printf "\e]P3968a38" # S_yellow
    printf "\e]PFffffff" # S_base3
    printf "\e]PDcf9ebe" # S_violet
    clear # against bg artifacts
fi
