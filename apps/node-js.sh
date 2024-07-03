gum spin -s line --title "Installing fnm" -- sleep 0.5

if ! command -v fnm &>/dev/null; then
	gum spin -s line --title "Installing fnm" -- sleep 0.5
	curl -fsSL https://fnm.vercel.app/install | bash
fi

source ~/.bashrc

if ! command -v node &>/dev/null; then
	fnm install --lts
else
	echo "Node is already installed, skipping installation."
fi
