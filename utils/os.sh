#!/bin/bash

_configure_osx() {
    echo " > Configuring OSX"

    defaults write com.apple.finder ShowPathbar -bool true
    defaults write com.apple.finder ShowStatusBar -bool true
    defaults write com.apple.dock show-process-indicators -bool true
    defaults write com.apple.dock show-recents -bool false

    defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
    defaults write -g ApplePressAndHoldEnabled -bool false
    defaults write NSGlobalDomain KeyRepeat -int 2
    defaults write NSGlobalDomain InitialKeyRepeat -int 25
    
    killall Dock

    chflags nohidden ~/Library
}

_pour_brew() {
  echo " > About to pour brew...."

  if test ! $(which brew)
    then
  echo " > Installing brew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
  fi

  echo " > Installing utils via brew"
  brew install git
  brew install curl
  brew install wget
  brew install tree
  brew install make
  brew install htop
  brew install nmap
  brew install unrar
  brew install azure-cli
  brew install jmeter
  brew install coreutils

# Dependencies
  brew install ghostscript
  brew install imagemagick
  brew install imagemagick@6
  brew install pandoc-citeproc
  brew install qpdf
  brew install watchman

# Development stuff
  brew install r
  brew install node
  brew install yarn
  brew install java
  brew install python

# Hardly relevant for the future
#  brew install postgres
#  brew tap heroku/brew
#  brew install heroku
#  brew install librsvg
  
  echo " > Installing applications via brew cask"
  brew cask install docker
  brew cask install google-chrome
  brew cask install firefox
  brew cask install spotify
  brew cask install visual-studio-code
  brew cask install 1password
  brew cask install whatsapp
  brew cask install rstudio
  brew cask install mactex
  brew cask install cyberduck
  brew cask install dbeaver-community
  brew cask install balenaetcher
  brew cask install caffeine

# Hardly relevant for the future
#  brew cask install insomnia
#  brew cask install inkscape
#  brew cask install owasp-zap
#  brew cask install logitech-camera-settings
#  brew cask install diffmerge

  echo " > Brew is over!"

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

_brew() {
  read -p " > Should we setup brew and all that jazz? (y/n)" -n 1 -r
  echo 
  if [[ $REPLY =~ ^[Yy]$ ]]; then
      _pour_brew
    else
      echo " > Skipping all that jazz!"
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
      echo " > Seems like you're using a Mac"
      _osx
      _brew
    else
      echo " > There's no environment settings for your machine"
      echo " > Skipping this step..."
  fi
}
