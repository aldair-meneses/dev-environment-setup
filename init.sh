#!/bin/bash
set -e

DISTROS=("Ubuntu" "Debian GU/Linux")

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_DIR="${SCRIPT_DIR}/configs"
THEME_DIR="${SCRIPT_DIR}/themes"

for DISTRO in "${DISTROS[@]}"; do
  if [ "$(sed -n '/^NAME/p' /etc/os-release | tr -d \"NAME=)" = "$DISTRO" ]; then
    eval "$(cat ~/.bashrc | tail +10)"
  fi
done

user_path_string=$(sed '2!d' ./configs/bash/user_local_path)
if ! grep -q "$user_path_string" ~/.bashrc; then
  cat "$CONFIG_DIR"/bash/user_local_path >>~/.bashrc
fi

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

function init() {

  CHOICE=$(
    gum choose "Install Essentials" "Installing Apps" "Setup Lazyvim" \
      "Setup Alacritty" "Setup Progamming Languages" "Setup Gnome Keybindings" \
      "Quit"
  )

  if [ "$CHOICE" == "Quit" ]; then
    exit 0
  fi

  if [ "$CHOICE" == "Install Essentials" ]; then
    gum spin -s line --title "Installing Essentials" -- sleep 1
    source ./libs/essentials.sh
    init
  fi

  if [ "$CHOICE" == "Setup Lazyvim" ]; then
    APP=lazyvim
    gum confirm "Do you want to install Lazyvim and its dependencies?" &&
      source ./apps/$APP/$APP.sh
    init
  fi

  if [ "$CHOICE" == "Setup Alacritty" ]; then
    APP=alacritty
    gum confirm "Do you want to install alacritty and its dependencies?" &&
      source ./apps/$APP/$APP.sh
    init
  fi

  if [ "$CHOICE" == "Setup Gnome Keybindings" ]; then
    APP=alacritty
    gum confirm "Do you want to set Gnome Keybindings?" &&
      source $CONFIG_DIR/gnome/*.sh || init
  fi

  if [ "$CHOICE" == "Setup Progamming Languages" ]; then
    gum spin -s line --title "Installing Progamming Languages" -- sleep 1
    for script in ./programming/languages/*.sh; do source $script; done
    init
  fi

  if [ "$CHOICE" == "Installing Apps" ]; then
    gum spin -s line --title "Installing Apps" -- sleep 1
    for script in ./apps/*.sh; do source $script; done
    init
  fi

}

init
