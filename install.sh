#!/bin/bash
echo " > About to setup dotfiles, aliases, etc."

# Enable nullglob
shopt -s dotglob

source utils/utils.sh

TARGET=.bash_profile
DOTFILE=.dotfile
ALTERNATE=.bashrc

init_files $TARGET $ALTERNATE $DOTFILE

for dot in dots/adds/.add*[A-Za-z]; do
  _base=$(basename $dot)
  _source_base="source ~/$_base"
  _append "$_source_base" "$DOTFILE"
done

copy_dots $DOTFILE

finalize $TARGET $DOTFILE

# Disable nullglob
shopt -u nullglob

echo " > Splendid! You're all set :-D"