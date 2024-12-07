#!/usr/bin/bash

if ! command -v rustup &> /dev/null; then
  # ref: https://www.rust-lang.org/ja/tools/install
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "Rust already exists."
fi

cargo_version=$(cargo --version)
echo "cargo version: $cargo_version"