# Debian/Ubuntu Post Installation (Gnome environment)
This is a step by step that I use to setup my dev environment after a Ubuntu/Debian Based OS Fresh Installation.

## First softwares and first steps
- Active mouse focus follows: ```gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'```
- git installation: ```sudo apt install git```
- vim installation ```sudo apt install vim``` 
- Firefox installation: https://support.mozilla.org/en-US/kb/install-firefox-linux
- Add Firefox icon: ```wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop -P /usr/local/share/applications```
- Chrome installation: https://www.google.com/intl/pt-BR/chrome/
- Install some password manager. 
- Code-insiders: https://code.visualstudio.com/insiders/ 
- Symbol link para o code: ```sudo ln -s /usr/share/code-insiders/bin/code-insiders /usr/bin/code```
- RocketChat: https://github.com/RocketChat/Rocket.Chat.Electron/releases

## Generate a ssh key
- How to: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Remove snap softwares
I don't use Snap software, so I use this command : ```sudo snap list``` to check which snap software are installed and the remove one by one.

## Install Docker Engine
Follow this how to Docker Engine: https://docs.docker.com/engine/install/ubuntu/
After instal, follow this post Docker Engine installation: https://docs.docker.com/engine/install/linux-postinstall/

## Setup browser accounts
Using this command: ```firefox -p``` will be add the profile switcher in the startup browser screen. Do it, and then, create the desired profiles.

## Softwares I usaully use
- Flatpak: ```sudo apt install flatpak```
- Curl: ```sudo apt install curl```
- Discord: https://discord.com/
- Telegram: ```sudo apt install telegram-desktop```
