set -e

gum spin --spinner dot --title "Installing alacritty..." -- sleep 1

sudo apt install -y alacritty

gum spin --spinner dot --title "Starting alacritty setup..." -- sleep 1

mkdir -p ~/.config/alacritty

cp ./configs/alacritty/font.toml ~/.config/alacritty/font.toml
cp ./configs/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
