#!/bin/bash

SCRIPT_VERSION=0.0.1
HOMEBREW_SCRIPT=./homebrew.sh
ITERM2_SCRIPT=./iterm.sh
GIT_SCRIPT=./git.sh
MISE_SCRIPT=./mise.sh
VSCODE_SCRIPT=./vscode.sh
LAZARUS_SCRIPT=./lazarus.sh

echo "Setup script v$SCRIPT_VERSION"

temp="$HOME/.local"
echo "temp is $temp"

#Runs $1 inline if exists and returns 0
#If $1 does not exist returns 1 or, if $2 is true exits the entire script

execute_if_exists () {
  if [ -f "$1" ]; then
    source $1
    return 0
  else
    if [ "$2" = true ]; then
      exit;
    else
      return 1
    fi
  fi    
}

  #Call individual installation scripts
  execute_if_exists $HOMEBREW_SCRIPT true
  execute_if_exists $GIT_SCRIPT false
  execute_if_exists $ITERM2_SCRIPT false
  execute_if_exists $MISE_SCRIPT false 
  execute_if_exists $VSCODE_SCRIPT false
  execute_if_exists $LAZARUS_SCRIPT false
