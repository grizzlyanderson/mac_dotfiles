#!/usr/bin/env bash

HSDIR="/home/eanderso/.homesick"

if [ -d $HSDIR ]; then
  exit 0
fi

mkdir -p $HSDIR && cd $HSDIR

git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

$HOME/.homesick/repos/homeshick/bin/homeshick clone grizzlyanderson/deb_dotfiles

exit 0
