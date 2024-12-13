#!/usr/bin/bash

current_dir=$(pwd)
home_dir=$HOME

source_path="$current_dir/term/.wezterm.lua"
target_path="$home_dir/.wezterm.lua"
if [ -L "$target_path" ]; then
  echo "$target_path already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi


if ! command -v alacritty &> /dev/null; then
  cargo install alacritty
fi
alacritty_version=$(alacritty --version)
echo "alacritty version: $alacritty_version)"

