#!/usr/bin/env bash

CPU_ARCH=$(uname -m)
APT_INSTALL_LIST=$(cat "$SRC_DIR/install_list/apt_install.txt")
CARGO_INSTALL_LIST=$(cat "$SRC_DIR/install_list/cargo_install.txt")
