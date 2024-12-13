#!/usr/bin/bash

# Prerequisites
#  - cargo

current_dir=$(pwd)
source_path="$current_dir/nvim"
target_path="$HOME/.config/nvim"

if ! command -v nvim &> /dev/null; then
  echo "Neovim is not installed, installing..."
  sudo snap install nvim
else
  if [ ! -e "$target_path" ]; then
    ln -s "$source_path" "$target_path"
    echo "Created symbolic link: $target_path -> $source_path"
  else
    echo "Symbolic link or directory already exists: $target_path"
  fi
fi

nvim_version=$(nvim --version | head -n 1)
echo "nvim version: $nvim_version"


# neovide
if ! command -v neovide &> /dev/null; then
  echo "Neovide is not installed, installing..."
  cargo install --git https://github.com/neovide/neovide
else
  echo "Neovide already exists."
fi

neovide_version=$(neovide --version)
echo "Neovide version: $neovide_version"


# lazygit
if ! command -v lazygit &> /dev/null; then
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  sudo install lazygit -D -t /usr/local/bin/
fi

lazygit_version=$(lazygit --version)
echo "Lazygit version: $lazygit_version"
