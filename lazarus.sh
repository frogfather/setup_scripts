#!/bin/bash

file_exists () {
  if [ -f "$1" ]; then
    return 0
  else
      return 1
  fi
}

directory_exists () {
  if [ -d "$1" ]; then
    return 0
  else 
    return 1
  fi
}

download_and_install () {
  #detect type from download path
  if [[ $1 == *".dmg"* ]]; then
      FILETYPE=".dmg"
  elif [[ $1 == *".pkg"* ]]; then
      FILETYPE=".pkg"
  else
      echo "Cannot determine file type" 
      exit;
  fi
  DOWNLOAD_PATH=$1
  FILENAME=$2
  INSTALL_DIR=$3
  PACKAGE_TYPE=$4

  #check for install directory. If it's there we can assume the software in already installed
  directory_exists "$INSTALL_DIR"
  if [ $? -eq 1 ]; then
    echo "$FILENAME not installed"
    file_exists "./$FILENAME"
    if [ $? -eq 1 ]; then
      echo "Downloading $FILENAME"
      curl -fSL -o $FILENAME $DOWNLOAD_PATH
    else
      echo "$FILENAME already downloaded"
    fi
    echo "Installing $FILENAME"
    if [ $FILETYPE = ".dmg" ]; then
      MOUNTDIR=$(echo `hdiutil mount $FILENAME | tail -1 | awk '{$1=$2=""; print $0}'` | xargs -0 echo)
    else
      MOUNTDIR=$FILENAME
    fi
    sudo installer -pkg "${MOUNTDIR}/"*."$PACKAGE_TYPE" -target /
  else
    echo "$FILENAME already installed"
  fi

}
  directory_exists "/Applications/Lazarus"
  if [ $? -eq 1 ]; then
    download_and_install https://sourceforge.net/projects/lazarus/files/Lazarus%20macOS%20x86-64/Lazarus%203.2/fpc-3.2.2.intelarm64-macosx.dmg/download "fpc.dmg" "/usr/local/lib/fpc" "mpkg"
    download_and_install https://sourceforge.net/projects/lazarus/files/Lazarus%20macOS%20x86-64/Lazarus%203.2/fpc-src-3.2.2-20210709-macosx.dmg/download "fpcsrc.dmg" "/usr/local/share/fpcsrc" "pkg"
    download_and_install https://sourceforge.net/projects/lazarus/files/Lazarus%20macOS%20x86-64/Lazarus%203.2/Lazarus-3.2-macosx-x86_64.pkg/download "lazarus.pkg" "/Applications/Lazarus" "pkg"
  else
    echo "Lazarus is installed"
  fi