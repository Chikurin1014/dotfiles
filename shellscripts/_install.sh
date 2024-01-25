#!/usr/bin/env bash

APT_INSTALL="$SRC_DIR/shellscripts/install/_apt_install.sh"
CAGO_INSTALL="$SRC_DIR/shellscripts/install/_cargo_install.sh"

MODE="$1"

echo "Updating apt packages ..."
sudo apt-get update -yqq
echo " -> Done"
echo ""
echo "Installing jq ..."
sudo apt-get install -yqq jq
echo " -> Done"
echo ""

if [[ $MODE == "Full" ]]; then
    source $APT_INSTALL
    source $CAGO_INSTALL
elif [[ $MODE == "Minimal" ]];then
    source $APT_INSTALL
else
    exit 1
fi
