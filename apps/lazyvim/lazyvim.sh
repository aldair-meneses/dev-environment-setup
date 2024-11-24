#!/bin/bash

gum spin --spinner dot --title "Installing Lazyvim requirements..." -- sleep 1

sudo apt install fzf fd-find ripgrep fonts-firacode -y
gsettings set org.gnome.desktop.interface font-name "FiraCode Nerd Font 11"

CURRENT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
NEOVIM_CONFIG_PATH="$HOME/.config/nvim"

if ! command -v nvim &>/dev/null; then
  source "$CURRENT_PATH"/deps/neovim.sh
fi

if [ -d "$NEOVIM_CONFIG_PATH.bak" ]; then
  gum confirm "A backup of nvim already exists. Do you want to replace it with a new backup of the current nvim that is installed?" &&
    rm -r $NEOVIM_CONFIG_PATH.bak || mv "$NEOVIM_CONFIG_PATH.bak"{,.bak}
fi

if [ -n "$NEOVIM_CONFIG_PATH" ] && [ -d "$NEOVIM_CONFIG_PATH" ]; then
  mv "$NEOVIM_CONFIG_PATH"{,.bak}
fi

gum spin --spinner dot --title "Installing Lazygit" -- sleep 1

source "$CURRENT_PATH"/deps/lazygit.sh

git clone https://github.com/LazyVim/starter ~/.config/nvim &&
  rm -rf ~/.config/nvim/.git
