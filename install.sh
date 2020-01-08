#!/bin/bash

echo " "
echo "-------------------------------------------"
echo "  About to setup dotfiles, aliases, etc."
echo "-------------------------------------------"
echo " "

source utils/utils.sh

## Enable nullglob
shopt -s dotglob


## Globals
TARGET=.bash_profile
DOTFILE=.dotfile
ALTERNATE=.bashrc

init_files $TARGET $ALTERNATE $DOTFILE


echo " "
echo "Appending from dots/sources to $DOTFILE"
echo " "
for dot in dots/sources/.add*[A-Za-z]; do
  _base=$(basename $dot)
  _source_base="source ~/$_base"
  append "$_source_base" "$DOTFILE"
done


echo " "
echo "Copying .dotfile TO $HOME"
echo " "
cp -vi $DOTFILE $HOME


echo " "
echo "Copying from dots to $HOME"
echo " "
for dot in dots/.*[A-Za-z]; do
  cp -vi "$dot" $HOME
  echo " "
done


echo " "
echo "Copying from dots/sources to $HOME"
echo " "
for dot in dots/sources/.add*[A-Za-z]; do
  cp -vi "$dot" $HOME
  echo " "
done


for dot in dots/boilerplates/.*[A-Za-z]; do
  _boilerplate=$(basename $dot)

  if [ -f $HOME/$_boilerplate ]; then
    echo "Seems like there's an instance of $_boilerplate in $HOME"
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


echo " "
echo "Sourcing $TARGET"
echo " "
source $HOME/$TARGET

echo " "
echo "-------------------------------------------"
echo "  Splendid! You're all set :-D"
echo "-------------------------------------------"
echo " "