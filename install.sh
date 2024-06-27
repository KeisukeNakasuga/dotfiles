#!/usr/bin/bash

current_dir=$(pwd)
home_dir=$HOME

# install .wezterm.lua
source_path="$current_dir/.wezterm.lua"
target_path="$home_dir/.wezterm.lua"
if [ -L "$target_path" ]; then
  echo "$target_path is already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi

# .Xmodmap
source_path="$current_dir/.Xmodmap"
target_path="$home_dir/.Xmodmap"
if [ -L "$target_path" ]; then
  echo "$target_path is already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi