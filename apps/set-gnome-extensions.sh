if ! command -v pipx &>/dev/null; then
	echo "pipx not found, it will be installed bofore proceeding with gext installation"
	sudo apt update
	sudo apt install pipx gnome-tweaks -y
fi

if ! command -v gext &>/dev/null; then
	echo "installing gnome-extensions-cli"
	bash -c "pipx install gnome-extensions-cli --system-site-packages"
fi

export PATH=$HOME/.local/bin:$PATH

gnome-extensions disable tiling-assistant@ubuntu.com
gnome-extensions disable ubuntu-dock@ubuntu.com
gnome-extensions disable ding@rastersoft.com

gum confirm "To install the extensions, please confirm"
gum style --foreground 212 --border normal --border-foreground 212 --margin "1 2" --padding "2" "Installing Extensions"

bash -c "gext install tactile@lundal.io"
bash -c "gext install just-perfection-desktop@just-perfection"
bash -c "gext install blur-my-shell@aunetx"
bash -c "gext install space-bar@luchrioh"
