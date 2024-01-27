#!/usr/bin/env bash

APT_INSTALL="$SRC_DIR/shellscripts/install/_apt_install.sh"
CARGO_INSTALL="$SRC_DIR/shellscripts/install/_cargo_install.sh"

if [[ "$MODE" == "Full" ]]; then
    source "$APT_INSTALL"
    source "$CARGO_INSTALL"
elif [[ "$MODE" == "Minimal" ]]; then
    sudo apt-get install -y build-essential curl git libssl-dev ssh > /dev/null 2>&1
elif [[ "$MODE" == "No-Install" ]]; then
    return 0
else
    return 1
fi

echo ""
