#!/bin/bash

set -e

CURRENT_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

gum spin --spinner dot --title "Starting alacritty setup..." -- sleep 1

function apt_installation() {
  gum spin --spinner dot --title "Installing alacritty using APT" -- sleep 1
  sudo apt install -y alacritty

  mkdir -p ~/.config/alacritty

}

function rust_installation() {

  source $PROGAMMING_DIR/languages/rust.sh

  gum spin --spinner dot --title "Installing alacritty using Cargo" -- sleep 1

  if [ ! -d /tmp/alacritty ]; then
    git clone https://github.com/alacritty/alacritty.git /tmp/alacritty
  fi

  cd /tmp/alacritty

  rustup override set stable
  rustup update stable

  cargo build --release

  infocmp alacritty

  sudo cp target/release/alacritty /usr/local/bin
  sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install extra/linux/Alacritty.desktop
  sudo update-desktop-database

  sudo mkdir -p /usr/local/share/man/man1
  sudo mkdir -p /usr/local/share/man/man5
  scdoc <extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null
  scdoc <extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz >/dev/null
  scdoc <extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz >/dev/null
  scdoc <extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz >/dev/null
}

function alacritty_dependencies() {
  cp ./configs/alacritty/font.toml ~/.config/alacritty/font.toml
  cp ./configs/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml

  gum spin --spinner dot --title "Installing alacritty dependencies" -- sleep 1

  for script in "$CURRENT_PATH"/deps/*.sh; do source $script; done
}

if ! command -v alacritty &>/dev/null; then
  if [ "$CURRENT_DISTRO" = "Debian GNU/Linux" ]; then
    gum confirm "Do you want to install it with Rust?" &&
      rust_installation || apt_installation
  else
    apt_installation
  fi
fi

return
