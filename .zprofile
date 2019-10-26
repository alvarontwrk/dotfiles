# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# start ssh-agent
eval $(ssh-agent)

export TERMINAL='/usr/bin/dbus-launch gnome-terminal'
