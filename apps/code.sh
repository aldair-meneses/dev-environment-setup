#!/bin/bash

set -e

if command -v eza /dev/null &>/dev/null; then
  gum style --foreground "#00FF9C" "Code is already installed."
  return
fi

cd /tmp && curl -L -o code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" &&\
sudo dpkg -i code.deb && cd -

gum style --foreground "#00FF9C" "Code was succefully installed."
