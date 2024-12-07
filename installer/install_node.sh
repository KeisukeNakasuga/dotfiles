#!/usr/bin/bash

if ! command -v volta &> /dev/null; then
  echo "Volta is not installed, installing..."
  curl https://get.volta.sh | bash
  VOLTA_HOME="$HOME/.volta"
  if [ -f "$HOME/.bashrc" ]; then
    echo 'export "# volta settings"' >> "$HOME/.bashrc"
    echo 'export VOLTA_HOME="$HOME/.volta"' >> "$HOME/.bashrc"
    echo 'export PATH="$VOLTA_HOME/bin:$PATH"' >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
  fi
else
  echo "Volta already exist."
fi

volta_version=$(volta --version)
echo "Volta version: $volta_version"

# install latest node & npm
volta install node
volta install npm

node_version=$(node --version)
npm_version=$(npm --version)
echo "Node.js version: $node_version"
echo "npm version: $npm_version"