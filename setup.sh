#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Function to check if the system is Fedora Silverblue
is_fedora_silverblue() {
  if [ -f "/run/ostree-booted" ] && command_exists rpm-ostree; then
    return 0
  else
    return 1
  fi
}

# Detect package manager
if is_fedora_silverblue; then
  brew update
  brew install nvim stow ripgrep fzf zoxide

  docker completion zsh >~/.local/share/zinit/completions/_docker
elif command_exists apt; then
  sudo apt update
  sudo apt install zsh nvim stow ripgrep fzf kitty tmux

  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  curl -sS https://starship.rs/install.sh | sh

  docker completion zsh >~/.local/share/zinit/completions/_docker

  chsh -s $(which zsh)
fi

cd ~/.dotfiles

stow zsh
stow tmux
stow nvim
stow kitty
