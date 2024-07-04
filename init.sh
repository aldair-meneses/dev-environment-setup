#!/bin/bash
set -e

CONFIG_DIR="./configs"
THEME_DIR="./themes"

if ! command -v gum &>/dev/null; then
	echo "Gum.sh will be installed"
	echo "Updating packages..."
	sudo apt update -y && sudo apt upgrade -y
	echo "Installing gum and its dependencies..."
	sudo apt install curl -y
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/charm.gpg
	echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
	sudo apt update && sudo apt install gum -y
fi

CHOICE=$(gum choose "Install Essentials" "Installing Apps" "Setup Lazyvim" "Setup Alacritty" "Quit")

if [ "$CHOICE" == "Quit" ]; then
	exit 0
fi

if [ "$CHOICE" == "Install Essentials" ]; then
	gum spin -s line --title "Installing Essentials" -- sleep 1
	source ./libs/essentials.sh
fi

if [ "$CHOICE" == "Setup Lazyvim" ]; then
	APP=lazyvim
	gum confirm "Do you want to install Lazyvim and its dependencies?" &&
		source ./apps/$APP/$APP.sh
fi

if [ "$CHOICE" == "Setup Alacritty" ]; then
	APP=alacritty
	gum confirm "Do you want to install alacritty and its dependencies?" &&
		source ./apps/$APP/$APP.sh
fi

if [ "$CHOICE" == "Installing Apps" ]; then
	gum spin -s line --title "Installing Apps" -- sleep 1
	for script in ./apps/*.sh; do source $script; done
fi
