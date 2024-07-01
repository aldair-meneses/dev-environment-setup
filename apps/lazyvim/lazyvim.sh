gum spin --spinner dot --title "Installing Lazyvim requirements..." -- sleep 1

sudo apt install fzf fd-find neovim ripgrep -y

NEOVIM_CONFIG_PATH="$HOME/.config/nvim"

if [ -d "$NEOVIM_CONFIG_PATH.bak" ]; then
	gum confirm "A backup of nvim already exists. Do you want to replace it with a new backup of the current nvim that is installed?" &&
		rm -r $NEOVIM_CONFIG_PATH.bak || mv "$NEOVIM_CONFIG_PATH.bak"{,.bak}
fi

if [ -n "$NEOVIM_CONFIG_PATH" ] && [ -d "$NEOVIM_CONFIG_PATH" ] ; then
	mv "$NEOVIM_CONFIG_PATH"{,.bak}
fi

git clone https://github.com/LazyVim/starter ~/.config/nvim &&\
rm -rf ~/.config/nvim/.git
