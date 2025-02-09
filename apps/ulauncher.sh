#!/bin/bash

set -e

if [ "$CURRENT_DISTRO" = "Pop!_OS" ]; then
  gum style --foreground "#00FF9C" "Pop!_OS has a better alternative to Ulauncher. No need to install it."
  return
fi

if [ "$CURRENT_DISTRO" = "Debian GU/Linux" ]; then
  sudo apt update && sudo apt install -y gnupg
  gpg --keyserver keyserver.ubuntu.com --recv 0xfaf1020699503176
  gpg --export 0xfaf1020699503176 | sudo tee /usr/share/keyrings/ulauncher-archive-keyring.gpg >/dev/null
  echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] \
          http://ppa.launchpad.net/agornostal/ulauncher/ubuntu jammy main" |
    sudo tee /etc/apt/sources.list.d/ulauncher-jammy.list
  sudo apt update && sudo apt install ulauncher
fi

if [ "$CURRENT_DSITRO" = "Ubuntu" ]; then
  sudo add-apt-repository universe -y &&
    sudo add-apt-repository ppa:agornostal/ulauncher -y &&
    sudo apt update && sudo apt install ulauncher
fi
