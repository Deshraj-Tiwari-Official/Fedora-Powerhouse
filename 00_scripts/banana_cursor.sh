#!/bin/bash

mkdir ~/.icons
cd ~/dotfiles/00_scripts/assets
for file in *.tar.xz; do
  tar -xvf "$file" -C ~/.icons
done
cd ~/dotfiles
