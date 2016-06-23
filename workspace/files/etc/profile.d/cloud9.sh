#!/bin/sh

if [ "$C9_SH_EXECUTED" ]; then
    # We already executed, let's not overwrite the path
    return
fi

export C9_FULLNAME=
export C9_HOSTNAME=
export C9_EMAIL=
export C9_USER=
export C9_PROJECT=
export C9_PID=
export C9_UID=

export C9_SH_EXECUTED=1
export C9_PORT=8080
export C9_IP=0.0.0.0
export C9_SHARED=/mnt/shared

export PATH=/mnt/shared/bin:$HOME/workspace/node_modules/.bin:$HOME/bin\
:$PATH\
:/mnt/shared/sbin:/opt/gitl:/opt/go/bin:/mnt/shared/c9/app.nw/bin

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export LANGUAGE=C.UTF-8
export HGUSER="$C9_FULLNAME"
export EMAIL="$C9_EMAIL"
export PORT="$C9_PORT"
export IP="$C9_IP"
if [ -d "$HOME/lib/python/site-packages" ]; then
    export PYTHONPATH="$PYTHONPATH:$HOME/lib/python/site-packages"
fi
if [ -d "/nix/.nix-profile/lib/ruby/gems" ]; then
    export GEM_PATH="$GEM_PATH:/nix/.nix-profile/lib/ruby/gems"
fi

export METEOR_IP="$IP"
export METEOR_PORT="$PORT"

[ "$GOROOT" ] || export GOROOT=/opt/go
[ "$GOPATH" ] || export GOPATH=/home/ubuntu/workspace

[ "$BASH_VERSION" ] || return 0

# remove nada-nix-compat.sh in old workspaces
if [ -e /etc/profile.d/nada-nix-compat.sh ]; then
    sudo rm -f /etc/profile.d/nada-nix-compat.sh & 
fi

LAST_LINE=$(tail -1 /home/ubuntu/.profile)
if [ "$LAST_LINE" == '[ -s "/home/ubuntu/.nvm/nvm.sh" ] && . "/home/ubuntu/.nvm/nvm.sh" # This loads nvm' ]; then
    WRAP_START='[ "$BASH_VERSION" ] \&\& npm() { if [ "$*" == "config get prefix" ]; then which node | sed "s/bin\\/node//"; else $(which npm) "$@"; fi } # hack: avoid slow npm sanity check in nvm'
    WRAP_END='unset npm # end hack'
    sed -iE 's!.*This loads nvm!'"$WRAP_START\n&\n$WRAP_END!" /home/ubuntu/.profile
fi

# fix broken .gitconfig
if grep -qs "askpass = /bin/echo" ~/.gitconfig; then
    sed -i 's!askpass = /bin/echo/!!' ~/.gitconfig
fi

for S in /mnt/shared/profile.d/*; do
    [ -e $S ] && . $S
done

if X='() { :; }; echo Vulnerable' bash -c pwd 2>/dev/null | grep -q Vulnerable; then
    (( sudo apt-get update &>/dev/null &&
       sudo apt-get install bash &>/dev/null) &)
fi

_xdgopen() {
    if [ -e "$@" ]; then
        c9 "$@"
        return
    fi
    command xdg-open "$@"
}

_gnomeopen() {
    if [ -e "$@" ]; then
        c9 "$@"
        return
    fi
    command xdg-open "$@"
}

export -f _xdgopen _gnomeopen
alias xdg-open=_xgdopen
alias gnome-open=_gnomeopen
alias open=c9
