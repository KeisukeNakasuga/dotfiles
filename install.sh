#!/usr/bin/bash

sudo apt update

# install volta
if ! command -v volta &> /dev/null
then
  echo "install volta."
  curl https://get.volta.sh | bash
  VOLTA_HOME="$HOME/.volta"
  if [ -f "$HOME/.bashrc" ]; then
    echo 'export "# volta settings"' >> "$HOME/.bashrc"
    echo 'export VOLTA_HOME="$HOME/.volta"' >> "$HOME/.bashrc"
    echo 'export PATH="$VOLTA_HOME/bin:$PATH"' >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
  fi
else
  echo "volta is already exist."
fi
volta_version=$(volta --version)
echo "volta version: $volta_version"

# install latest node & npm
volta install node
volta install npm

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

# .emacs.d
source_path="$current_dir/.emacs.d"
target_path="$home_dir/.emacs.d"
if [ -L "$target_path" ]; then
  echo "$target_path is already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi

# gnome
sudo apt -y install xdotool

source_path="$current_dir/move_left.sh"
target_path="$home_dir/move_left.sh"
if [ -L "$target_path" ]; then
  echo "$target_path is already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi

source_path="$current_dir/move_right.sh"
target_path="$home_dir/move_right.sh"
if [ -L "$target_path" ]; then
  echo "$target_path is already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi