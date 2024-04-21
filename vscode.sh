#!/bin/bash

INSTALLED=false
search_dir=/Applications
for entry in "$search_dir"/*
do
  if [[ "$entry" = *"/Applications/Visual"* ]]; then
    echo "Visual Studio Code is installed"
    INSTALLED=true
  fi
done
  if [ $INSTALLED = false ]; then
    echo "Visual Studio Code not found - installing"
    brew install --cask visual-studio-code
  fi
