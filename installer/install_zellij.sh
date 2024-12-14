#!/usr/bin/bash

if ! command -v zellij &> /dev/null; then
  cargo install --locked zellij
fi

zellij_version=$(zellij --version)
echo "zellij version: $zellij_version"

current_dir=$(pwd)
home_dir=$HOME
source_path="$current_dir/term/zellij/config.kdl"
target_path="$home_dir/.config/zellij/config.kdl"
if [ -L "$target_path" ]; then
  echo "$target_path already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi
