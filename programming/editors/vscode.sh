#!/bin/bash

set -e

PROFILE_NAME="PHP"
VSCODE_CONFIG_DIR=$CONFIG_DIR/vscode

gum spin -s line --title "Installing Visual Studio Code extensions for PHP profile" -- sleep 1

while read extension; do
  code --install-extension $extension --profile $PROFILE_NAME
done < "$VSCODE_CONFIG_DIR/php-extensions.txt"