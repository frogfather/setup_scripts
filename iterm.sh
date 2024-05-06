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
        rm ./ohmyzsh_install.sh
fi
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
        echo "zsh autosuggestions is installed"
else
        echo "zsh autosuggestions not found - installing"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
        echo "zsh syntax highlighting is installed"
else
        echo "zsh syntax highlighting not found - installing"
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
if [ -d ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting ]; then
        echo "fast syntax highlighting is installed"
else
        echo "fast syntax highlighting not found - installing"
        git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
fi
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autocomplete ]; then
        echo "zsh autocomplete is installed"
else
        echo "zsh autocomplete not found - installing"
        git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
fi

        #Find a way of inserting a line into the list of plugins
        #Currently plugins=(git)
        #We want to be able to add items regardless of whether it's 
        
        #plugins=(
        #  plugin1
        #  plugin2
        #)

        #or plugins=(plugin1)
        #https://stackoverflow.com/questions/18272379/bash-inserting-a-line-in-a-file-at-a-specific-location


