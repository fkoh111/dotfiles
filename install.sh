#!/bin/bash

echo " "
echo "------------------------------------------"
echo "  About to setup dotfiles, aliases, etc.  "
echo "------------------------------------------"
echo " "

DOTFILES=$PWD/dots/
BASHRC=$PWD/bashrc/.bashrc

## Enable nullglob
shopt -s dotglob

echo " "
echo "COPYING DOTFILES TO $HOME"

for file in $DOTFILES.*[A-Za-z]; do
  cp -vi "$file" $HOME
done

echo " "
echo "COPYING .bashrc TO $HOME"

for file in $BASHRC; do
  cp -vi "$file" $HOME
done


## Append a source cmd to .bash_profile if it isn't there all ready
grep -qxF 'source ~/.bashrc' ~/.bash_profile || echo 'source ~/.bashrc' >> ~/.bash_profile

## Disable nullglob
shopt -u nullglob

echo " "
echo "------------------------------------------"
echo "  Splendid! You're all set :-D            "
echo "------------------------------------------"
echo " "
