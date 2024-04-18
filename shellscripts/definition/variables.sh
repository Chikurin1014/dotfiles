#!/usr/bin/env bash

# the variable is used in the other scripts
# shellcheck disable=SC2034
CPU_ARCH=$(uname -m)
APT_INSTALL_LIST=$(cat "$SRC_DIR/install_list/apt_install.txt")
CARGO_INSTALL_LIST=$(cat "$SRC_DIR/install_list/cargo_install.txt")
