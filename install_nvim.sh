#!/usr/bin/bash

current_dir=$(pwd)
home_dir=$HOME

source_path="$current_dir/nvim"
target_path="$home_dir/.config/nvim"
if ! command -v nvim &> /dev/null
then
  sudo snap -y install nvim
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi
