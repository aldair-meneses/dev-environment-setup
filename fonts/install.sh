mkdir -p ~/.local/share/fonts
FONT_NAME="FiraCode"

cd /tmp

wget -N https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${FONT_NAME}.zip

unzip -u ${FONT_NAME}.zip -d ${FONT_NAME}

cp ${FONT_NAME}/*.ttf ~/.local/share/fonts

fc-cache 

cd -
