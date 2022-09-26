# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/scripts" ] ; then
    PATH="$HOME/scripts:$PATH"
fi

if [ -d "$HOME/.gocode/bin" ] ; then
    PATH="$HOME/.gocode/bin:$PATH"
fi

# start ssh-agent
#eval $(ssh-agent)

export TERMINAL='/usr/bin/dbus-launch gnome-terminal'

# [[ $(tty) == '/dev/tty1' ]] && startx

# Created by `pipx` on 2021-04-18 20:54:27
export PATH="$PATH:/home/alvaro/.local/bin"

#while ! mount $HOME/mnt/webdav; do echo "Trying to mount webdav"; done
