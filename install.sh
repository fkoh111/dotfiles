#!/bin/sh

echo " "
echo "------------------------------------------"
echo "  About to setup dotfiles, aliases, etc.  "
echo "------------------------------------------"
echo " "

PATH_ALIAS=$PWD/alias
EXE_ALIAS=$PATH_ALIAS/.alias

## Copy .alias to $HOME
if [ -f $EXE_ALIAS ]; then
   cp -f $EXE_ALIAS $HOME
else
   echo "Whoops, I thought there would be an alias here..."
fi

## Append a source cmd to .bash_profile if it isn't there all ready
grep -qxF 'source ~/.alias' ~/.bash_profile || echo 'source ~/.alias' >> ~/.bash_profile
