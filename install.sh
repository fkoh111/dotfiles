#!/bin/bash

echo "-------------------------------------------"
echo "  About to setup dotfiles, aliases, etc.   "
echo "-------------------------------------------"

source utils/utils.sh

## Enable nullglob
shopt -s dotglob


## Globals
TARGET=.bash_profile
ALTERNATE=.bashrc
DOTFILE=.dotfile

init_files $TARGET $ALTERNATE $DOTFILE

setup_dotfile

#echo " "
#echo "Copying from dots/sources to $HOME"
#echo " "
#for dot in dots/sources/.add*[A-Za-z]; do
#  cp -vi "$dot" $HOME
#  echo " "
#done


for dot in dots/boilerplates/.*[A-Za-z]; do
  _boilerplate=$(basename $dot)

  if [ -f $HOME/$_boilerplate ]; then
    echo "Seems like there's already an instance of $_boilerplate in $HOME"
    echo " "
  else
    echo "Copying a boilerplate of $_boilerplate"
    cp $PWD/dots/boilerplates/$_boilerplate $HOME/$_boilerplate
    echo " "
  fi
done


## Append a source cmd to $TARGET (Will NOT append if the cmd is already present)
append "source ~/$DOTFILE" "$HOME/$TARGET"

## Disable nullglob
shopt -u nullglob


echo "Sourcing $TARGET"
source $HOME/$TARGET

echo "-------------------------------------------"
echo "  Splendid! You're all set :-D"
echo "-------------------------------------------"