#!/bin/bash

read -p "Enter User: " user
read -p "Enter IP address: " host

home="/home/$user"
local_tmp=$(mktemp -d)

sudo tar czf "$local_tmp/root_dotfiles.tar.gz" -C /root .bashrc .vimrc .tmux.conf

scp "$local_tmp/root_dotfiles.tar.gz" "$user@$host:$home/"

rm -rf "$local_tmp"

ssh -t "$user@$host" bash << EOF
  sudo mv "$home/root_dotfiles.tar.gz" /root/
  sudo tar xzf "/root/root_dotfiles.tar.gz" -C /root
  sudo rm "/root/root_dotfiles.tar.gz"

  # Start an interactive root shell
  sudo -i

  # After the root shell exits, clean up the dot files
  sudo rm -f /root/.bashrc /root/.vimrc /root/.tmux.conf
EOF
