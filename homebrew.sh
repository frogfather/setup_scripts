#!/bin/bash

#Check if installed - install if not
#Update if installed
#TODO see if we can do equivalent of source ~/.zshrc to reload
#this doesn't work in non interactive shells
if ! command -v /opt/homebrew/bin/brew doctor &> /dev/null 
then
  echo "Homebrew not found - installing"
  curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
  # then install it
  chmod +x ./install.sh
  #./install.sh
  echo export PATH=/opt/homebrew/bin:$PATH >> ~/.zshrc
  rm ./install.sh
fi

if command -v /opt/homebrew/bin/brew doctor &> /dev/null
then
  echo "Homebrew is installed"
else
  echo "Homebrew installation failed. Exiting"
fi
