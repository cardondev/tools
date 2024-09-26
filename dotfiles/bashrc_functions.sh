#!/bin/bash

# Create a directory and change to it
mkcd() { 
    mkdir -p "$1" && cd "$1"
}

# Extract compressed files
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Simple calculator
calc() {
    echo "scale=2; $*" | bc
}

# Command separator
command_separator() {
    echo -e "\033[38;5;226m$(printf '%.0s=' $(seq 1 $(tput cols)))\033[0m"
}

# Display system information
sysinfo() {
    echo -e "\033[0;36mHostname:\033[0m $(hostname)"
    echo -e "\033[0;36mKernel:\033[0m $(uname -r)"
    echo -e "\033[0;36mUptime:\033[0m $(uptime -p)"
    echo -e "\033[0;36mDate & Time:\033[0m $(date '+%Y-%m-%d %H:%M:%S')"
    echo -e "\033[0;36mRed Hat Release:\033[0m $(cat /etc/redhat-release 2>/dev/null || echo 'Not a Red Hat system')"
    echo -e "\033[0;36mIP Addresses:\033[0m"
    ip -4 addr | awk '/inet / {print "  " $NF ": " $2}' | sed 's/\/.*$//'
    echo -e "\n\033[0;36mTop 3 CPU-consuming processes:\033[0m"
    ps aux --sort=-%cpu | awk 'NR<=4 {print $11, $3"%"}' | column -t
    echo -e "\n\033[0;36mTop 3 Memory-consuming processes:\033[0m"
    ps aux --sort=-%mem | awk 'NR<=4 {print $11, $4"%"}' | column -t
}

# Welcome message
welcome() {
    clear
    turbo_mode
    echo -e "\033[38;5;10m"
    echo "▗▄▄▄▖▗▖ ▗▖▗▄▄▖ ▗▄▄▖  ▗▄▖     ▗▖  ▗▖ ▗▄▖ ▗▄▄▄ ▗▄▄▄▖     ▗▄▖  ▗▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖  ▗▖ ▗▄▖▗▄▄▄▖▗▄▄▄▖▗▄▄▄ "
    echo "  █  ▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌▐▌ ▐▌    ▐▛▚▞▜▌▐▌ ▐▌▐▌  █▐▌       ▐▌ ▐▌▐▌     █    █  ▐▌  ▐▌▐▌ ▐▌ █  ▐▌   ▐▌  █"
    echo "  █  ▐▌ ▐▌▐▛▀▚▖▐▛▀▚▖▐▌ ▐▌    ▐▌  ▐▌▐▌ ▐▌▐▌  █▐▛▀▀▘    ▐▛▀▜▌▐▌     █    █  ▐▌  ▐▌▐▛▀▜▌ █  ▐▛▀▀▘▐▌  █"
    echo "  █  ▝▚▄▞▘▐▌ ▐▌▐▙▄▞▘▝▚▄▞▘    ▐▌  ▐▌▝▚▄▞▘▐▙▄▄▀▐▙▄▄▖    ▐▌ ▐▌▝▚▄▄▖  █  ▗▄█▄▖ ▝▚▞▘ ▐▌ ▐▌ █  ▐▙▄▄▖▐▙▄▄▀"
    echo -e "\033[0m"
    echo -e "\033[0;36mToday is $(date +'%A, %B %d, %Y')\033[0m"
    echo ""
    sysinfo
}

#Turbo Mode 
turbo_mode() {
    echo -e "\033[1;33m"
    echo "TURBO MODE"
    echo -e "\033[0;32m" 
    echo "⣴⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo "⠘⢷⣄⡀⠉⠉⣙⣿⠶⠀⠀⠀⠀⠀⣀⣠⡴⠶⠚⠛⠉⠉⠉⠀⠀⢸⡇⠈⠉⠉⢉⡛⠓⠶⢦⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo "⠀⠀⠙⣿⠉⠉⠹⣧⠀⠀⣀⣤⠶⠛⠋⠁⠀⠀⠀⠀⢀⣀⣀⣀⠀⢸⡄⢠⡴⢿⡋⠉⠻⣦⠀⠈⠉⠓⢦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo "⠀⠀⠀⠘⣧⠀⣀⣼⠿⠛⠛⠛⠒⠒⠲⠶⠦⣤⣀⠀⢸⣿⣿⣿⠀⢸⡇⣿⠀⢸⣏⠉⠋⠙⣇⠀⠀⢀⣀⣈⣙⣷⣤⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo "⠀⠀⠀⠀⣽⣞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠉⠛⠿⣿⣟⠛⠀⠀⣧⢻⡄⠀⠙⠷⢤⣤⡿⠀⢰⡏⠉⢉⣭⢿⣿⣟⣉⣉⠛⠓⠶⢤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo "⠀⠀⠀⢸⣿⠟⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣟⠓⠲⢶⣬⣍⣛⠒⠲⠿⠦⠿⠦⢤⣤⣤⣼⣧⣤⣼⠶⠞⠋⠁⠈⠁⠉⠉⠉⠉⠛⠒⠶⣬⣍⡛⠶⣤⡀⠀⠀⠀⠀⠀⠀"
    echo "⠀⠀⠀⣿⣩⡿⠃⠀⣀⣠⣤⠤⣤⣄⣀⠀⠀⠹⣷⠶⠦⢽⣆⠉⠙⠛⠶⠦⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠶⠖⠛⠛⠛⠶⢦⡀⠀⠈⠙⠳⣦⣙⠷⣄⡀⠀⠀⠀"
    echo "⠀⠀⠀⢸⡇⢀⡴⠛⠉⠀⢀⣀⠀⠀⠙⢳⡄⠀⠸⣧⠤⠤⣽⣆⠀⠀⠀⠀⠀⠈⠉⠛⠲⠦⢤⣄⣀⠀⠀⣴⠋⠁⢀⣀⣤⣤⣀⠀⠀⠻⣆⠀⠀⠀⠀⠙⠳⣮⣿⣦⡀⠀"
    echo "⠀⠀⠀⠈⣷⡾⠁⠀⣴⣾⣿⣿⣿⣦⠀⠀⢻⡀⠀⣿⠀⠀⠀⠛⠶⢤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠉⠙⢻⡇⠀⢠⡿⢿⣾⣿⡿⢷⠀⠀⢻⡀⠀⠀⠀⠀⠀⠀⠉⣩⣿⡄"
    echo "⠀⠀⠀⠀⢹⡇⠀⠐⣿⢿⣿⣿⣿⣾⡇⠀⢸⡇⠀⠙⠓⠒⠶⠶⠶⠦⢤⣤⣭⣍⣛⣛⣶⣶⣤⣤⣀⣀⣸⡇⠀⠸⣟⣿⢻⣯⣟⣿⠀⠀⣸⠃⠀⠀⠀⠀⠀⠀⠀⢿⣏⣿"
    echo "⠀⠀⠀⠀⠀⢷⡀⠀⠻⣾⣰⣏⣹⡿⠁⠀⣼⣁⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣉⣉⣉⣉⣉⣙⣛⣿⡄⠀⠙⠷⢼⡷⠞⠋⠀⣠⣟⣀⣀⣀⣀⣀⣀⣀⣀⣤⡿⠃"
    echo "⠀⠀⠀⠀⠀⠈⢷⣄⠀⠈⠉⠉⠁⠀⢀⡾⠋⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠻⣦⣀⠀⠀⠀⠀⣀⡴⠋⠉⠉⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀"
    echo "⠀⠀⠀⠀⠀⠀⠀⠙⠳⠦⢤⣤⠤⠾⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠒⠒⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "\033[0m"
}
