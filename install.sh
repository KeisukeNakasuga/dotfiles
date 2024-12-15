#!/usr/bin/bash

chmod +x ./installer/*.sh
./installer/install_core.sh
./installer/install_rust.sh
./installer/install_node.sh
./installer/install_term.sh
./installer/install_zellij.sh
./installer/install_x.sh
