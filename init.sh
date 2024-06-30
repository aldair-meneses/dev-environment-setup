#!/bin/bash
set -e

if ! command -v gum &> /dev/null; then
	echo "Gum.sh will be installed"
	echo "Updating packages..."
	sudo apt update -y && sudo apt upgrade -y
	echo "Installing gum and its dependencies..."
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
	echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
	sudo apt update && sudo apt install gum -y
fi

CHOICE=$(gum choose "Install Essentials" "Setup Gnome", "Quit")

if [ "$CHOICE" == "Install Essentials" ]; then
       gum spin -s line --title "Installing Essentials" -- sleep 1
       source ./libs/essentials.sh
fi
