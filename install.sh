#!/bin/bash

echo " "
echo "-------------------------------------------"
echo "  About to setup dotfiles, aliases, etc."
echo "-------------------------------------------"
echo " "

source utils/utils.sh

# Globals
TARGET=.bash_profile
DOTFILE=.dotfile
ALTERNATE=.bashrc
# Enable nullglob
shopt -s dotglob

init_files $TARGET $ALTERNATE $DOTFILE

for dot in dots/sources/.add*[A-Za-z]; do
  _base=$(basename $dot)
  _source_base="source ~/$_base"
  append "$_source_base" "$DOTFILE"
done

copy_dots $DOTFILE

# Append source cmd to $TARGET
append "source ~/$DOTFILE" "$HOME/$TARGET"

# Disable nullglob
shopt -u nullglob
source $HOME/$TARGET

echo " "
echo "-------------------------------------------"
echo "  Splendid! You're all set :-D"
echo "-------------------------------------------"
echo " "