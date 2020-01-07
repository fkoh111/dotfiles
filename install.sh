#!/bin/bash

echo " "
echo "-------------------------------------------"
echo "  About to setup dotfiles, aliases, etc."
echo "-------------------------------------------"
echo " "


## Globals
TARGET=.bash_profile
DOTFILE=.dotfile


## Source utils
source utils/utils.sh


## Enable nullglob
shopt -s dotglob


## Verifying .bash_profile in $HOME
if [ -f $HOME/$TARGET ]; then
    echo "Seems like we have a $TARGET in $HOME"
else
    echo "WHUT?! Why don't you have a $TARGET"
    exit
fi

## Verify  .dotfile
if [ ! -f $DOTFILE ]; then
    touch $DOTFILE
fi

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


## Append a source cmd to .bash_profile (will not append if the cmd is already present)
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
