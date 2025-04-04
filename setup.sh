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
  # Install tools
  brew update
  brew install neovim stow ripgrep fzf zoxide kitty
elif command_exists apt; then
  # Install tools
  sudo apt update
  sudo apt install zsh neovim stow ripgrep fzf kitty tmux
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  curl -sS https://starship.rs/install.sh | sh

  # Set default shell
  chsh -s $(which zsh)
fi

# Add docker completions cause zsh does not have them by default
if command_exists docker; then
  mkdir -p ~/.local/share/zinit/completions
  docker completion zsh >~/.local/share/zinit/completions/_docker
fi

# Install nerd fonts
cd /tmp
curl -L -o JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMonoNerdFont
fc-cache -fv

# Setup dotfiles
cd ~/.dotfiles
stow zsh --adopt
stow tmux --adopt
stow nvim --adopt
stow kitty --adopt
