#!/usr/bin/bash

current_dir=$(pwd)
home_dir=$HOME

# zsh & Powerlevel10k & zsh-syntax-highlighting
if ! command -v zsh &> /dev/null; then
  sudo apt -y install zsh
  # Powerlevel10k
  sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /opt/powerlevel10k
  echo 'source /opt/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
  # zsh-syntax-highlight
  sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /opt/zsh-syntax-highlighting
  echo "source /opt/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
fi

source_path="$current_dir/term/.zshrc"
target_path="$home_dir/.zshrc"
if [ -L "$target_path" ]; then
  echo "$target_path already exist."
else
  mkdir "$home_dir/.config/alacritty"
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi

zsh_version=$(zsh --version)
echo "zsh version: $zsh_version"


# wezterm
source_path="$current_dir/term/.wezterm.lua"
target_path="$home_dir/.wezterm.lua"
if [ -L "$target_path" ]; then
  echo "$target_path already exist."
else
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi


# alacritty
if ! command -v alacritty &> /dev/null; then
  cargo install alacritty
fi
alacritty_version=$(alacritty --version)
echo "alacritty version: $alacritty_version)"

source_path="$current_dir/term/alacritty.toml"
target_path="$home_dir/.config/alacritty/alacritty.toml"
if [ -L "$target_path" ]; then
  echo "$target_path already exist."
else
  mkdir "$home_dir/.config/alacritty"
  ln -s "$source_path" "$target_path"
  echo "create symbolic link: $target_path -> $source_path"
fi
