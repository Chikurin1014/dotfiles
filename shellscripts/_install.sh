#!/usr/bin/env bash

[[ $1 == "No-Install" ]] && exit 0

APT_INSTALL="$SRC_DIR/shellscripts/install/_apt_install.sh"
CARGO_INSTALL="$SRC_DIR/shellscripts/install/_cargo_install.sh"

MODE="$1"

if [[ "$MODE" == "Full" ]]; then
    source "$APT_INSTALL"
    source "$CARGO_INSTALL"
elif [[ "$MODE" == "Minimal" ]]; then
    source "$APT_INSTALL"
else
    exit 1
fi
