#!/bin/bash

# Colorize output
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Improved commands
alias mkdir='mkdir -pv'
alias wget='wget -c'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias top='top -d 1'

# Network
alias ports='netstat -tulpn'
alias listen='lsof -i -P | grep LISTEN'

# Package management (for Red Hat-based systems)
alias update='dnf update'
alias install='dnf install'
alias remove='dnf remove'
alias search='dnf search'

# Miscellaneous
alias hist='history'
alias c='clear'

# Systemd
alias sts='systemctl status'
alias stp='systemctl stop'
alias srt='systemctl start'

#Fun
alias turbo='turbo_mode'
