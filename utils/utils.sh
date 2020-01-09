#!/bin/bash

_append() {
  _ADD_EXPRESSION=$1
  _TARGET=$2  
  echo " > Appending expression $_ADD_EXPRESSION to $_TARGET"

  grep -qxF "$_ADD_EXPRESSION" "$_TARGET" || echo "$_ADD_EXPRESSION" >> "$_TARGET"
}

_init_target() {
  _TARGET=$1
  _ALTERNATE=$2

  if [ -f $HOME/$_TARGET ]; then
      echo " > Seems like we have a $_TARGET in $HOME"
  elif [ -f $HOME/$_ALTERNATE ]; then
      echo " > Changing to $_ALTERNATE from $_TARGET"
     TARGET=$_ALTERNATE
  else
      echo " > WHUT?! Why don't you have a $_TARGET?"
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


_copy_dots() {
  _DOTFILE=$1

    echo " > Copy $_DOTFILE to $HOME"
    cp -vi $_DOTFILE $HOME

    echo " > Copying from dots to $HOME"
    for dot in dots/.*[A-Za-z]; do
      cp -vi "$dot" $HOME
    done

    echo " > Copying from dots/sources to $HOME"
    for dot in dots/sources/.add*[A-Za-z]; do
      cp -vi "$dot" $HOME
    done
}

_copy_boilerplates() {
    for dot in dots/boilerplates/.*[A-Za-z]; do
      _BOILERPLATE=$(basename $dot)

      if [ -f $HOME/$_BOILERPLATE ]; then
        echo " > Seems like there's an instance of $_BOILERPLATE in $HOME"
      else
        echo " > Copying a boilerplate of $_BOILERPLATE to $HOME"
        cp $PWD/dots/boilerplates/$_BOILERPLATE $HOME/$_BOILERPLATE
      fi
    done
}

copy_dots() {
  _DOTFILE=$1

  _copy_dots $_DOTFILE
  _copy_boilerplates
}

finalize() {
  _TARGET=$1
 _DOTFILE=$2

  _append "source ~/$_DOTFILE" "$HOME/$_TARGET"
  source $HOME/$_DOTFILE
  rm $_DOTFILE
}
