#!/bin/bash
echo " > About to setup dotfiles, aliases, etc."

# Enable nullglob
shopt -s dotglob

source utils/utils.sh

TARGET=.bash_profile
DOTFILE=.dotfile
ALTERNATE=.bashrc

init_files $TARGET $ALTERNATE $DOTFILE

append_sources dots/adds/.add\*[A-Za-z]  $DOTFILE

copy_dots $DOTFILE

finalize $TARGET $DOTFILE

# Disable nullglob
shopt -u nullglob

echo " > Splendid! You're all set :-D"