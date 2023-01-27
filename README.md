# Ubuntu pós instalação
O que fazer logo logo após instala o Ubuntu no meu sistema? 

## Primeiros softwares e passos
- Ative o focus follows mouse: ```gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'```
- git: ```sudo apt install git```
- vim ```sudo apt install vim``` 
- Firefox: https://support.mozilla.org/en-US/kb/install-firefox-linux
- Firefox icon: ```wget https://raw.githubusercontent.com/mozilla/sumo-kb/main/install-firefox-linux/firefox.desktop -P /usr/local/share/applications```
- Chrome: https://www.google.com/intl/pt-BR/chrome/
- Instale o gerenciador de senha. 
- Code-insiders: https://code.visualstudio.com/insiders/ 
- Symbol link para o code: ```sudo ln -s /usr/share/code-insiders/bin/code-insiders /usr/bin/code```
- RocketChat: https://github.com/RocketChat/Rocket.Chat.Electron/releases

## Crie um ssh para o novo sistema
- Como criar: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Remova softwares snap
Use o comando ```sudo snap list``` para verificar quais softwares snaps estão instalados.

## Instalando o docker engine 
Passo a passo para o Docker Engine: https://docs.docker.com/engine/install/ubuntu/
Pós instalação do Docker Engine: https://docs.docker.com/engine/install/linux-postinstall/

## Configure as contas do seu navegador
Utilize o comando ```firefox -p``` para pode adicionar o profile switcher e crie os perfís necessários.

## Softwares que costumo utilizar
- Flatpak: ```sudo apt install flatpak```
- Curl: ```sudo apt install curl```
- Discord: https://discord.com/
- Telegram: ```sudo apt install telegram-desktop```
