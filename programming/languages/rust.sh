#¡/bin/bash
set -e

if ! command -v rustup &>/dev/null; then
  gum style --foreground "#00FF9C" "Rust will be installed"
  bash -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y
fi
