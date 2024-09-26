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
PS1='\[\e[38;5;208;40;1m\][\[\e[92m\]\w\[\e[38;5;208m\]]\[\e[0m\]\n\[\e[93m\]\D{%Y-%m-%d}\[\e[0m\] \[\e[40;1m\]|\[\e[0m\] \[\e[38;5;196;40;1m\]\t\[\e[0m\] \[\e[40;1m\]|\[\e[0m\] \[\e[96;40;1;3m\]\u\[\e[93m\]@\[\e[38;5;201m\]\h\[\e[38;5;42;5m\]\$\[\e[0m\] '

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

