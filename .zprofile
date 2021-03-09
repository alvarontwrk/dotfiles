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
eval $(ssh-agent)

export TERMINAL='/usr/bin/dbus-launch gnome-terminal'

[[ $(tty) == '/dev/tty1' ]] && startx
