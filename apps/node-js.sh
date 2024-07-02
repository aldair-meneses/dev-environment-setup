gum spin -s line --title "Installing fnm" -- sleep 0.5

if ! command -v fnm &>/dev/null; then
	curl -fsSL https://fnm.vercel.app/install | bash
fi

source ~/.bashrc

gum spin -s line --title "Installing fnm" -- sleep 0.5
fnm install --lts
