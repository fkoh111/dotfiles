#!/bin/bash

append() {
  _ADD_EXPRESSION=$1
  _TARGET=$2  
  echo "Appending expression $_ADD_EXPRESSION to $_TARGET"

  grep -qxF "$_ADD_EXPRESSION" "$_TARGET" || echo "$_ADD_EXPRESSION" >> "$_TARGET"
}

_init_target() {
  _TARGET=$1
  _ALTERNATE=$2

  if [ -f $HOME/$_TARGET ]; then
      echo "Seems like we have a $_TARGET in $HOME"
  elif [ -f $HOME/$_ALTERNATE ]; then
      echo "Changing to $_ALTERNATE from $_TARGET"
     TARGET=$_ALTERNATE
  else
      echo "WHUT?! Why don't you have a $_TARGET?"
     exit
  fi

}

_init_dotfile() {
  _DOTFILE=$1

  if [ ! -f $_DOTFILE ]; then
      touch $_DOTFILE
  fi
}

init_files() {
  _TARGET=$1
  _ALTERNATE=$2
  _DOTFILE=$3

  _init_target $_TARGET $_ALTERNATE
  _init_dotfile $_DOTFILE
}

_append_dotfile() {
  _PATH=$1
  
  for dot in $_PATH; do
    _BASE=$(basename $dot)
    _SOURCE_BASE="source ~/$_base"
    append "$_SOURCE_BASE" "$DOTFILE"
  done
}

_copy() {
  _PATH=$1
  _DEST=$2

  for file in $_PATH; do
    cp -vi $_PATH $_DEST
  done
}

setup_dotfile() {
    _append_dotfile dots/sources/.add\*[A-Za-z]
    _copy $DOTFILE $HOME
}

