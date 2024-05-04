#!/bin/bash

if ! command -v mise  &> /dev/null
then
  echo "Mise not found - installing"
  curl https://mise.run | sh
  echo "eval \"\$($HOME/.local/bin/mise activate zsh)\"" >> "$HOME/.zshrc"
fi

