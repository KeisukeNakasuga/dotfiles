#!/usr/bin/bash

sudo apt -y update && sudo apt -y upgrade

chmod +x ./installer/*.sh
./installer/install_rust.sh
./installer/install_node.sh
./installer/install_term.sh
./installer/install_zelliji.sh
./installer/install_x.sh
