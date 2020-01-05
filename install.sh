#!/bin/bash

echo " "
echo "-------------------------------------------"
echo "  About to setup dotfiles, aliases, etc."
echo "-------------------------------------------"
echo " "


## Source utils
source utils/utils.sh


## Enable nullglob
shopt -s dotglob


## Verifying .bash_profile in $HOME
if [ -f $HOME/.bash_profile ]
  then
    echo "Seems like we have a .bash_profile"
    echo "$HOME/.bash_profile"
  else
    echo "WHUT?! Why don't you have a .bash_profile"
    exit
fi


echo " "
echo "Appending to .dotfile"
for file in dots/.*[A-Za-z]; do
  _base=$(basename $file)
  _source_base="source ~/$_base"
  append "$_source_base" ".dotfile"
done


echo " "
echo "Copying .dotfile TO $HOME"
echo " "
cp -vi .dotfile $HOME


echo " "
echo "Copying from dots to $HOME"
echo " "
for file in dots/.*[A-Za-z]; do
  cp -vi "$file" $HOME
done


## Append a source cmd to .bash_profile (will not append if the cmd is already present)
append "source ~/.dotfile" "$HOME/.bash_profile"

## Disable nullglob
shopt -u nullglob


echo " "
echo "Sourcing bash_profile"
echo " "
source $HOME/.bash_profile

echo " "
echo "-------------------------------------------"
echo "  Splendid! You're all set :-D"
echo "-------------------------------------------"
echo " "
