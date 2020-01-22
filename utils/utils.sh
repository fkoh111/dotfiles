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
     exit 1
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

    echo " > Copying from dots/adds to $HOME"
    for dot in dots/adds/.add*[A-Za-z]; do
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

append_sources() {
  _DOTFILE=$1

  for dot in dots/adds/.add*[A-Za-z]; do
    _BASE=$(basename $dot)
    _SOURCE_BASE="source ~/$_BASE"
    _append "$_SOURCE_BASE" "$_DOTFILE"
  done
}

_configure_osx() {
    echo " > Configuring OSX"

    defaults write com.apple.finder ShowPathbar -bool true
    defaults write com.apple.finder ShowStatusBar -bool true
    defaults write com.apple.dock show-process-indicators -bool true
    chflags nohidden ~/Library
}

_osx() {
  read -p " > Should we configure OSX? (y/n)" -n 1 -r
  echo 
  if [[ $REPLY =~ ^[Yy]$ ]]; then
      _configure_osx
    else
      echo " > Skipping OSX configuration"
  fi
}

_verify_os() {
  _os="$(uname -s)"
    case "${_os}" in
      Linux*)     _machine=Linux;;
      Darwin*)    _machine=Mac;;
    esac
  echo ${_machine}
}

configure_os() {
  _os=$(_verify_os)

  if [ "$_os" == Mac ]; then
      echo " > Seems like you're running OSX"
      #_osx
    else
      echo " > There's no environment settings for your machine"
      echo " > Skipping this step..."
  fi
}
