#!/usr/bin/bash

current_dir=$(pwd)
home_dir=$HOME

sudo apt -y install xdotool

source_path="$current_dir/x/move_left.sh"
target_path="$home_dir/move_left.sh"
if [ -L "$target_path" ]; then
  echo "$target_path already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi

source_path="$current_dir/x/move_right.sh"
target_path="$home_dir/move_right.sh"
if [ -L "$target_path" ]; then
  echo "$target_path already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi

# .Xmodmap
source_path="$current_dir/x/.Xmodmap"
target_path="$home_dir/.Xmodmap"
if [ -L "$target_path" ]; then
  echo "$target_path already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi