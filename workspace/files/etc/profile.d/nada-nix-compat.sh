#!/bin/bash -e

PROFILE=~/.nada-nix-profile

installedPackages() {
  if [ -e $PROFILE/list ]; then
    cat $PROFILE/list
    return
  fi
  TEMPFILE=`tempfile`
  find $PROFILE -type l | while read F; do
    readlink $F
  done | sed -E 's/^[^-]*-([a-zA-Z][^-/]*(-[^-/]*)*).*/\1/' | sort | uniq | tee $TEMPFILE
  mv -f $TEMPFILE $PROFILE/list
}

if [ ! -e $PROFILE ] || [ -e $PROFILE/done ] || [ "$NADA_CHECKED" ] || [ ! $ISOUTPUTPANE ]; then
  return
fi

export NADA_CHECKED=1

INSTALLED=`installedPackages`

echo "Hi there! Welcome to your newly updated Cloud9 workspace!"
echo
echo "We noticed you installed the following packages on your old workspace:"
echo
for I in $INSTALLED; do echo " - $I"; done
echo
echo "You may have to install these again on your new workspace."
echo "You can use the following commands to install packages:"
echo
echo "- sudo apt-get install PACKAGE   # installs a package"
echo "- sudo apt-cache search TEXT     # search for a package"
echo
echo "This message will self-destruct once you run one of the commands above ;)"

_apt_get() {
    echo done > $PROFILE/done &> /dev/null
    command apt-get "$@"
}
_apt_cache() {
    echo done > $PROFILE/done &> /dev/null
    command apt-cache "$@"
}
export -f _apt_get _apt_cache
alias apt-get=_apt_get
alias apt-cache=_apt_cache