# Set LS_COLORS to ensure color support
export LS_COLORS="di=38;5;81:fi=38;5;82:ln=38;5;79:pi=38;5;240"

alias ll='eza -A --group-directories-first --icons'
alias la='eza -A'
alias l='eza --classify --grid --group-directories-first --icons'
alias ls='eza --icons=auto'
#alias cat='bat --paging=never'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"   
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias discord-update='
  wget "https://discord.com/api/download?platform=linux&format=deb" -O ~/Downloads/discord-update.deb;
  sudo dpkg -i ~/Downloads/discord-update.deb;
  rm ~/Downloads/discord-update.deb;'
uppercase() {
echo "$@" | awk '{print toupper($0)}'
}

unfreeze() {
	xrandr --output HDMI-1-0 --off
    	xrandr --output HDMI-1-0 -r 144 --auto --primary --left-of eDP-1
}

alias disable-wc='sudo modprobe -r uvcvideo'
alias enable-wc='sudo modprobe -a uvcvideo'
alias docker-ip="docker inspect \
  -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}} $1'"
alias docker-kill='docker kill $(docker ps -q)'
alias cpcb='xclip -selection clipboard'
alias workflow='less /home/aldrick/workflow.md'
