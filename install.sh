#!/bin/sh

echo " "
echo "------------------------------------------"
echo "  About to setup dotfiles, aliases, etc.  "
echo "------------------------------------------"
echo " "

PATH_ALIAS=$PWD/alias
EXE_ALIAS=$PATH_ALIAS/.alias

## COPY .ALIAS TO $HOME
if [ -f $EXE_ALIAS ]; then
   cp -f $EXE_ALIAS $HOME
else
   echo "Whoops, I thought there would be an alias here..."
fi

echo "# -------------" >> ~/.bash_profile
echo "source ~/.alias" >> ~/.bash_profile
echo "# -------------" >> ~/.bash_profile
