#!/usr/bin/bash

if ! command -v tmux &> /dev/null; then
  sudo apt -y install tmux
fi

tmux_version=$(tmux -V)
echo "tmux version: $tmux_version"

current_dir=$(pwd)
home_dir=$HOME
source_path="$current_dir/term/tmux/tmux.conf"
target_path="$home_dir/.config/tmux/tmux.conf"
if [ -L "$target_path" ]; then
  echo "$target_path already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi

source_path="$current_dir/term/tmux/layout"
target_path="$home_dir/.config/tmux/layout"
if [ -L "$target_path" ]; then
  echo "$target_path already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi

