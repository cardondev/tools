#!/bin/bash
#
#
# 8 888888888o          .8.           ,o888888o.    8 8888     ,88' 8 888888888o       ,o888888o.         ,o888888o.    8 8888     ,88' 8 8888888888 8888888 8888888888 
# 8 8888    `88.       .888.         8888     `88.  8 8888    ,88'  8 8888    `88.  . 8888     `88.      8888     `88.  8 8888    ,88'  8 8888             8 8888       
# 8 8888     `88      :88888.     ,8 8888       `8. 8 8888   ,88'   8 8888     `88 ,8 8888       `8b  ,8 8888       `8. 8 8888   ,88'   8 8888             8 8888       
# 8 8888     ,88     . `88888.    88 8888           8 8888  ,88'    8 8888     ,88 88 8888        `8b 88 8888           8 8888  ,88'    8 8888             8 8888       
# 8 8888.   ,88'    .8. `88888.   88 8888           8 8888 ,88'     8 8888.   ,88' 88 8888         88 88 8888           8 8888 ,88'     8 888888888888     8 8888       
# 8 8888888888     .8`8. `88888.  88 8888           8 8888 88'      8 888888888P'  88 8888         88 88 8888           8 8888 88'      8 8888             8 8888       
# 8 8888    `88.  .8' `8. `88888. 88 8888           8 888888<       8 8888         88 8888        ,8P 88 8888           8 888888<       8 8888             8 8888       
# 8 8888      88 .8'   `8. `88888.`8 8888       .8' 8 8888 `Y8.     8 8888         `8 8888       ,8P  `8 8888       .8' 8 8888 `Y8.     8 8888             8 8888       
# 8 8888    ,88'.888888888. `88888.  8888     ,88'  8 8888   `Y8.   8 8888          ` 8888     ,88'      8888     ,88'  8 8888   `Y8.   8 8888             8 8888       
# 8 888888888P .8'       `8. `88888.  `8888888P'    8 8888     `Y8. 8 8888             `8888888P'         `8888888P'    8 8888     `Y8. 8 888888888888     8 8888       
#
#
###############################################################################
#                                  BACKPOCKET.SH                              #
###############################################################################
#                                                                             #
#  Script Name   : backpocket.sh                                              #
#  Author        : Cardondev                                                  #
#  Date Created  : 08 May 2024                                                #
#  Last Modified : Cardondev                                                  #
#  Date Modified : 05/08/24                                                   #
#  Version       : v1.0                                                       #
#                                                                             #
#  Description:                                                               #
#  This script enhances the bash shell with the following features:           #
#  - Custom and portable history management                                   #
#  - Enhanced autocompletion for commands from history                        #
#  - Command search functionality                                             #
#  - Session logging for keeping track of executed commands                   #
#=============================================================================#
#  Revision History:                                                          #
#  Date       | Author's Name | Version | Changes                             #
#  05/08/24   | CardonDev     | v1.0    | Initial release                     #
#=============================================================================#
#  Usage:                                                                     #
#  - Load backpocket: source backpocket --load                                #
#  - Load backpocket with a clean history: source backpocket --load-new       #
#  - Display help and usage information: backpocket --help                    #
#                                                                             #
###############################################################################
#
HISTFILE=~/.portable_bash_history
HISTSIZE=10000
SAVEHIST=10000

load_history() {
    history -c  
    history -r "$1" 
}

search_history() {
    read -p "What are you looking for? : " search_cmd
    history | grep --color=auto "$search_cmd"
}

LOGFILE=~/session_log.txt
exec > >(tee -a "$LOGFILE") 2>&1

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

usage() {
    echo "Usage: $0 [--load|--load-new|--help]"
    echo "  --load       Load the backpocket tool with the previous history (default)"
    echo "               This option loads the backpocket tools and preserves the existing history from the previous session."
    echo "               Example: source backpocket --load"
    echo
    echo "  --load-new   Load the backpocket tool with a new history file"
    echo "               This option clears the existing history and starts a new session with an empty history."
    echo "               Example: source backpocket --load-new"
    echo
    echo "  --help       Display help message"
    echo "               This flag displays the usage information for the script, explaining the available options and their purpose."
    echo "               Example: backpocket --help"
    echo
    echo "To use the command search function:"
    echo "1. Load backpocket into your current session using 'source backpocket --load' or 'source backpocket --load-new'."
    echo "2. Run the 'search_history' function in your shell."
    echo "3. Type the command you seek when prompted."
    echo "4. The matching commands from the history will be displayed with the result highlighted in color."
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --load)
            load_history "$HISTFILE"  
            ;;
        --load-new)
            load_history /dev/null 
            ;;
        --help)
            usage
            exit 0
            ;;
        *)
            echo "Invalid argument: $1"
            usage
            exit 1
            ;;
    esac
    shift
done

alias load_backpocket="source ~/backpocket --load"
alias load_backpocket_new="source ~/backpocket --load-new"

bind 'TAB:menu-complete'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
