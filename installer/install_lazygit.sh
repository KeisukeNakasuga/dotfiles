#!/usr/bin/bash

cargo install git-delta

current_dir=$(pwd)
source_path="$current_dir/lazygit/config.yml"
target_path="$HOME/.config/lazygit/config.yml"

if [ ! -e "$target_path" ]; then
    ln -s "$source_path" "$target_path"
    echo "Created symbolic link: $target_path -> $source_path"
  else
    echo "Symbolic link or directory already exists: $target_path"
  fi

