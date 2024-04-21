#!/bin/bash

if [[ ! -d /Applications/iTerm.app ]]; then
    echo "iTerm not found - installing"
    brew install --cask iterm2
else
    echo "iTerm is installed"
fi
if [ -d ~/.oh-my-zsh ]; then
	echo "oh-my-zsh is installed"
 else
 	echo "oh-my-zsh is not installed - installing"
        curl -fsSL -o ohmyzsh_install.sh  https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
        chmod +x ./ohmyzsh_install.sh
        ./ohmyzsh_install.sh
fi
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
        echo "zsh autosuggestions is installed"
else
        echo "zsh autosuggestions not found - installing"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        #Find a way of inserting a line into the list of plugins
        #https://stackoverflow.com/questions/18272379/bash-inserting-a-line-in-a-file-at-a-specific-location

fi