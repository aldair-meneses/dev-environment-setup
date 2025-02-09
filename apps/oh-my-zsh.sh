#!/bin/bash
gum spin -s line --title "Installing oh-my-zsh" -- sleep 0.5

set -e

sudo apt install zsh -y

if [ -d $HOME/.oh-my-zsh ]; then
  sudo rm -r "$HOME/.oh-my-zsh"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
exit

sudo apt install git zsh-syntax-highlighting zsh-autosuggestions fzf -y

cp "$CONFIG_DIR/oh-my-zsh/.zshrc" "$HOME/.zshrc"
cp "$CONFIG_DIR/oh-my-zsh/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"

chsh -s $(which zsh)
