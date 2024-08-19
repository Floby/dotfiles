#!/bin/bash

set -e -o pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

link_file () {
  echo ''
  dotfile=$1
  target="$HOME/$dotfile"
  source="$SCRIPT_DIR/$dotfile"
  echo linking $dotfile
  if [[ -e $target ]]; then
    echo "file $target already exists"
    if diff >/dev/null $target $source; then
      echo 'no difference found, relinking as is'
      rm $target && ln -s $source $target
    else
      echo "files are different, entering diff"
      vimdiff $target $source
    fi
  else
    echo 'file did not exist, linking as is'
    ln -s $source $target
  fi
}

dotfiles=$(find -type f -regex '\./\.[a-z0-9_-]+' | cut -c3-) # dotfiles without extensions

for dotfile in $dotfiles; do
  link_file $dotfile
done

