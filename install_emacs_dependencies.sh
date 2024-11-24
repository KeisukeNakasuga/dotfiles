#!/usr/bin/bash

if ! command -v node &> /dev/null
then
  echo "please install node."
  exit 1
fi

npm install -g pyright
npm -g list
