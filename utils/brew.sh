#!/bin/bash

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
brew install htop
brew install postgres
brew install r

echo " > Installing applications via brew cask"
brew cask install docker
brew cask install google-chrome
brew cask install firefox
brew cask install spotify
brew cask install visual-studio-code
brew cask install 1password
brew cask install whatsapp
brew cask install psequel
brew cask install rstudio
