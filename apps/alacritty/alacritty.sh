#!/bin/bash

set -e

CURRENT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

if ! command -v alacritty &>/dev/null; then
	gum spin --spinner dot --title "Installing alacritty..." -- sleep 1
	sudo apt install -y alacritty
fi

gum spin --spinner dot --title "Starting alacritty setup..." -- sleep 1

mkdir -p ~/.config/alacritty

cp ./configs/alacritty/font.toml ~/.config/alacritty/font.toml
cp ./configs/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

gum spin --spinner dot --title "Installing alacritty dependencies" -- sleep 1

for script in "$CURRENT_PATH"/deps/*.sh; do source $script; done
