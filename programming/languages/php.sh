#!/bin/bash
set -e

if command -v php -v &>/dev/null; then
  gum style --foreground "#00FF9C" "PHP Is already installed"
  continue
fi

gum spin -s line --title "Installing PHP and PHP Extensions" -- sleep 1

sudo apt install apt-transport-https

if [ "$CURRENT_DISTRO" = "Debian GU/Linux" ]; then
  sudo curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
  sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
  sudo apt update
fi

if [ "$CURRENT_DISTRO" = "Ubuntu" ]; then
  sudo add-apt-repository -y ppa:ondrej/php
  sudo apt update
fi

sudo apt -y install php8.3 php8.3-{cli,fpm,curl,apcu,intl,mbstring,opcache,pgsql,mysql,sqlite3,redis,xml,zip}

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --quiet && sudo mv composer.phar /usr/local/bin/composer
rm composer-setup.php
