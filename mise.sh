#!/bin/bash

if ! command -v mise  &> /dev/null
then
  echo "Mise not found - installing"
  curl https://mise.run | sh
  echo "eval \"\$(/Users/johncampbell/.local/bin/mise activate zsh)\"" >> "/Users/johncampbell/.zshrc"
fi

