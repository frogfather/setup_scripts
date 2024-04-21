#!/bin/bash

if ! command -v git  &> /dev/null
then
  echo "Git not found - installing"
  brew install git
else
  echo "Git is installed"
fi

