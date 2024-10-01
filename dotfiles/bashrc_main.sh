#!/bin/bash

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S %Z  "
export VIMINIT='let $MYVIMRC="$HOME/.vimrc_main" | source $MYVIMRC'

# History settings
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth:erasedups

# Shell options
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob

# Custom prompt
#PS1='\[\e[38;5;208;40;1m\][\[\e[92m\]\w\[\e[38;5;208m\]]\[\e[0m\]\n\[\e[93m\]\D{%Y-%m-%d}\[\e[0m\] \[\e[40;1m\]|\[\e[0m\] \[\e[38;5;196;40;1m\]\t\[\e[0m\] \[\e[40;1m\]|\[\e[0m\] \[\e[96;40;1;3m\]\u\[\e[93m\]@\[\e[38;5;201m\]\h\[\e[38;5;42;5m\]\$\[\e[0m\] '
PS1='\[\e[38;5;220;40;2m\]\D{%a %b %d, %Y %H:%M %Z}\[\e[0m\] \[\e[95;40;2;3m\]\u\[\e[38;5;208m\]@\[\e[96m\]\h\[\e[22;1;97;1;5m\]\$\n\[\e[23;25;2m\][\[\e[38;5;166;3m\]\w\[\e[23;97m\]]\n\[\e[22;1;38;5;49m\]-\[\e[38;5;46m\]>\[\e[0m\]'

# Source aliases and functions
if [ -f ~/.bashrc_aliases ]; then
    . ~/.bashrc_aliases
fi

if [ -f ~/.bashrc_functions ]; then
    . ~/.bashrc_functions
fi

# Command separator
PROMPT_COMMAND="command_separator"

# Turbo Mode Car
turbo_mode

# Welcome message
welcome

echo -e "\033[0;32mWelcome to the Matrix\033[0m"

