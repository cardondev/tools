#!/bin/bash
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

# Function: setroot
# Usage: setroot <file>
setroot() {
    if [ $# -ne 1 ]; then
        echo "Usage: setroot <file>"
        return 1
    fi
    chown root:root "$1"
}

# Function: backup config files
# Usage: bakcnf <config/file/path>
bakcnf() {
    if [ -z "$1" ]; then
        echo "Usage: bakcnf <config/file/path>"
        return 1
    fi

    CONFIG_FILE="$1"
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "Error: File '$CONFIG_FILE' does not exist."
        return 1
    fi

    TIMESTAMP=$(date +%F_%T)
    BACKUP_FILE="${CONFIG_FILE}.bak_${TIMESTAMP}"
    cp "$CONFIG_FILE" "$BACKUP_FILE"
    echo "Backup of '$CONFIG_FILE' created at '$BACKUP_FILE'"
}

# Function: search logs
# Usage: seelogs <logfile> <keyword> [start_date] [end_date]
seelogs() {
    if [ $# -lt 2 ]; then
        echo "Usage: seelogs <logfile> <keyword> [start_date] [end_date]"
        return 1
    fi

    LOG_FILE="$1"
    KEYWORD="$2"
    START_DATE="${3:-}"
    END_DATE="${4:-}"

    if [ ! -f "$LOG_FILE" ]; then
        echo "Error: Log file '$LOG_FILE' does not exist."
        return 1
    fi

    if [ -n "$START_DATE" ] && [ -n "$END_DATE" ]; then
        awk -v start="$START_DATE" -v end="$END_DATE" '
        $0 ~ start, $0 ~ end' "$LOG_FILE" | grep --color=auto "$KEYWORD"
    else
        grep --color=auto "$KEYWORD" "$LOG_FILE"
    fi
}

# Function: find largefiles
# Usage: showgrande <directory> [size]
showgrande() {
    DIRECTORY="${1:-.}"
    SIZE="${2:-100M}"

    if [ ! -d "$DIRECTORY" ]; then
        echo "Error: Directory '$DIRECTORY' does not exist."
        return 1
    fi

    echo "Finding files larger than $SIZE in $DIRECTORY..."
    find "$DIRECTORY" -type f -size +"$SIZE" -exec ls -lh {} + | awk '{ print $9 ": " $5 }'
}

# Function: cleanup temp
# Usage: cleantmp [days]
cleantmp() {
    DAYS="${1:-7}"
    TEMP_DIR="/tmp"

    echo “Cleaning up files in $TEMP_DIR older than $DAYS days…”

# Function: user info
# Usage: uinfo <username>
uinfo() {
    if [ -z "$1" ]; then
        echo "Usage: uinfo <username>"
        return 1
    fi

    USERNAME="$1"

    if ! id "$USERNAME" &>/dev/null; then
        echo "Error: User '$USERNAME' does not exist."
        return 1
    fi

    UID_GID=$(id "$USERNAME")
    GROUPS=$(groups "$USERNAME")
    HOME_DIR=$(getent passwd "$USERNAME" | cut -d: -f6)
    LAST_LOGIN=$(lastlog -u "$USERNAME" | tail -n1 | awk '{print $4,$5,$6,$7}')

    ACCOUNT_EXPIRED=$(chage -l "$USERNAME" | grep "Account expires" | cut -d: -f2 | xargs)

    LAST_PASS_CHANGE=$(chage -l "$USERNAME" | grep "Last password change" | cut -d: -f2 | xargs)

    LOCKED=$(passwd -S "$USERNAME" | awk '{print $2}')
    if [[ "$LOCKED" == "L" ]]; then
        LOCKED_STATUS="\033[1;31mLocked\033[0m"
    else
        LOCKED_STATUS="\033[1;32mUnlocked\033[0m"
    fi

    SUDO_GROUPS=("sudo" "wheel" "admin")
    in_sudo_group=false
    for group in "${SUDO_GROUPS[@]}"; do
        if getent group "$group" | grep -qw "$USERNAME"; then
            in_sudo_group=true
            break
        fi
    done

    if $in_sudo_group; then
        SUDO_PRIV="\033[1;32mFull\033[0m"
    else

        SUDOERS_ENTRIES=$(sudo grep -E "^$USERNAME\s+ALL\s+ALL" /etc/sudoers /etc/sudoers.d/* 2>/dev/null)

        if [ -n "$SUDOERS_ENTRIES" ]; then
            SUDO_PRIV="\033[1;32mFull\033[0m"
        else
            LIMITED_ENTRIES=$(sudo grep -E "^$USERNAME\s+ALL\s+" /etc/sudoers /etc/sudoers.d/* | grep -v "ALL")
            if [ -n "$LIMITED_ENTRIES" ]; then
                SUDO_PRIV="\033[1;33mLimited\033[0m"
            else
                SUDO_PRIV="\033[1;31mNo\033[0m"
            fi
        fi
    fi

    printf "\n===== User Information for '%s' =====\n\n" "$USERNAME"
    printf "%-25s | %-30s\n" "Attribute" "Value"
    printf "%-25s-+-%-30s\n" "-------------------------" "------------------------------"

    printf "%-25s | %-30s\n" "UID and GID" "$UID_GID"
    printf "%-25s | %-30s\n" "Groups" "$GROUPS"
    printf "%-25s | %-30s\n" "Home Directory" "$HOME_DIR"
    printf "%-25s | %-30s\n" "Last Login" "$LAST_LOGIN"
    printf "%-25s | %-30s\n" "Account Expires" "$ACCOUNT_EXPIRED"
    printf "%-25s | %-30s\n" "Last Password Change" "$LAST_PASS_CHANGE"
    printf "%-25s | %-30s\n" "Account Status" "$LOCKED_STATUS"
    printf "%-25s | %-30s\n" "Sudo Privileges" "$SUDO_PRIV"
    printf "\n"
}


