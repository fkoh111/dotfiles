#!/bin/bash

echo " "
echo "------------------------------------------"
echo "  About to setup dotfiles, aliases, etc.  "
echo "------------------------------------------"
echo " "


DOTFILES=$PWD/dots/
DOTFILE=$PWD/interface/.dotfile

## Source utils
. $PWD/utils/utils.sh


## Enable nullglob
shopt -s dotglob


## Test for .bashrc in $HOME
if [ -f $HOME/.bashrc ]
  then
    echo "Seems like we have a .bashrc file"
    TARGET=$HOME/.bashrc
    echo "$TARGET this is from target bashrc"
fi


## Test for .bash_profile in $HOME
if [ -f $HOME/.bash_profile ]
  then
    echo "Seems like we have a .bash_profile"
    TARGET=$HOME/.bash_profile
    echo "$TARGET this is from target bash profile"
  else
    echo "WHUT?! Why don't you have a bash_profile or bashrc?!"
fi


echo " "
echo "COPYING .dotfile TO $HOME"

cp -vi $PWD/interface/.dotfile $HOME


echo " "
echo "COPYING .bashrc TO $HOME"

cp -vi $PWD/bashrc/.bashrc $HOME


echo " "
echo "COPYING . FROM DOTFILES TO $HOME"

for file in $DOTFILES.*[A-Za-z]; do
  cp -vi "$file" $HOME
done


## Append a source cmd to .bash_profile if it isn't there all ready
append 'source ~/.bashrc' ~/.bash_profile


## Disable nullglob
shopt -u nullglob


echo " "
echo "------------------------------------------"
echo "  Splendid! You're all set :-D            "
echo "------------------------------------------"
echo " "
