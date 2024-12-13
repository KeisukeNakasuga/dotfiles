#!/usr/bin/bash

if ! command -v zellij &> /dev/null; then
  cargo install --locked zellij
fi

zellij_version=$(zellij --version)
echo "zellij version: $zellij_version"
