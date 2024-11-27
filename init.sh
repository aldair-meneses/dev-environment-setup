#!/bin/bash
set -e

DISTROS=("Ubuntu" "Debian GNU/Linux")

DISTRO_NAME=$(source /etc/os-release && echo $NAME)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CONFIG_DIR="${SCRIPT_DIR}/configs"
THEME_DIR="${SCRIPT_DIR}/themes"
PROGAMMING_DIR="${SCRIPT_DIR}/programming"

for DISTRO in "${DISTROS[@]}"; do
  if [ "$DISTRO_NAME" = "$DISTRO" ]; then
    eval "$(cat ~/.bashrc | tail +10)"
    CURRENT_DISTRO="$DISTRO"
    echo "Running installer for $CURRENT_DISTRO"
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
    gum choose "Install Essentials" "Setup Fonts" "Install Apps" "Setup Lazyvim" \
      "Setup Alacritty" "Setup Progamming Languages" "Setup Gnome Keybindings" \
      "Quit"
  )

  trap error_handler ERR

  if [ "$CHOICE" == "Quit" ]; then
    exit 0
  fi

  if [ "$CHOICE" == "Install Essentials" ]; then
    gum spin -s line --title "Installing Essentials" -- sleep 1
    source ./libs/essentials.sh
    init
  fi

  if [ "$CHOICE" == "Setup Fonts" ]; then
    gum spin -s line --title "Installing fonts" -- sleep 1
    source ./fonts/install.sh
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
    LANGS=()

    PROGAMMING_LANG_DIR="${PROGAMMING_DIR}/languages"

    for LANG in "${PROGAMMING_LANG_DIR}"/*.sh; do
      LANGS+=("$(basename "$LANG")")
    done

    readarray -t LANG_CHOICES < <(gum choose "${LANGS[@]}" --no-limit)

    if [ "${#LANG_CHOICES[@]}" -eq 0 ]; then
      gum style --foreground "#3D3BF3" "No languages selected"
      echo "${LANG_CHOICES[@]}"
      init
    fi

    echo -e "Languages selected:\n" | gum style --foreground "#3D3BF3" --margin "1 2" "${LANG_CHOICES[@]}"

    gum spin -s line --title "Installing Progamming Languages" -- sleep 1

    for LANG_CHOICE in "${LANG_CHOICES[@]}"; do
      source "${PROGAMMING_LANG_DIR}/${LANG_CHOICE}"
    done

    init
  fi

  if [ "$CHOICE" == "Install Apps" ]; then
    INSTALLATION_METHOD=$(gum choose "Installing All" "Select an app to install")

    if [ "$INSTALLATION_METHOD" == "Installing All" ]; then
      gum spin -s line --title "Installing Apps" -- sleep 1

      for script in ./apps/*.sh; do source $script; done
    fi

    if [ "$INSTALLATION_METHOD" == "Select an app to install" ]; then

      APP_CHOICE=$(gum choose $(ls ./apps/*.sh | xargs -i echo {}))
      source "$APP_CHOICE"
    fi
    init
  fi

}

function error_message() {
  gum style --foreground "#bf0000" "$1"
}

function error_handler() {
  error_message "An error ocurred during the execution of the script."
  init
}

init
