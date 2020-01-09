#!/bin/bash

echo " "
echo "  About to setup dotfiles, aliases, etc."
echo " "

# Enable nullglob
shopt -s dotglob

source utils/utils.sh

# Globals
TARGET=.bash_profile
DOTFILE=.dotfile
ALTERNATE=.bashrc

init_files $TARGET $ALTERNATE $DOTFILE

for dot in dots/sources/.add*[A-Za-z]; do
  _base=$(basename $dot)
  _source_base="source ~/$_base"
  append "$_source_base" "$DOTFILE"
done

copy_dots $DOTFILE

finalize $TARGET $DOTFILE

# Disable nullglob
shopt -u nullglob

echo " "
echo "  Splendid! You're all set :-D"
echo " "