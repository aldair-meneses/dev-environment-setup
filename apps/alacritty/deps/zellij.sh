if ! command -v zellij &>/dev/null; then
  gum spin -s line --title "Installing Zellij" -- sleep 1
  cd /tmp
  wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
  if [ ! -d "/tmp/zellijar" ]; then
    tar -xf zellij.tar.gz zellij
  fi
  sudo install zellij /usr/local/bin
  rm zellij.tar.gz zellij
  cd -
fi

mkdir -p ~/.config/zellij/
[ ! -f "$HOME/.config/zellij/config.kdl" ] && cp "$CONFIG_DIR/zellij/config.kdl" ~/.config/zellij/config.kdl
[ ! -d "$HOME/.config/zellij/themes" ] && mkdir -p ~/.config/zellij/themes/

cp "$THEME_DIR"/zellij/*.kdl ~/.config/zellij/themes/
