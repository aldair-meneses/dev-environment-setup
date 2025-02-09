#!/bin/sh

cd /tmp

wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
tar -xf nvim.tar.gz
sudo install nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
sudo cp -R nvim-linux-x86_64/lib /usr/local
sudo cp -R nvim-linux-x86_64/share /usr/local
sudo ln -s /usr/local/bin/nvim /usr/local/bin/vim
rm -rf nvim-linux-x86_64.nvim64/bin/nvim
cd -
