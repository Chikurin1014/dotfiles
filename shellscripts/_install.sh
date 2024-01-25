#!/usr/bin/env bash

sudo -v # ask sudo password at first

SRC_DIR=`cd $(dirname $BASH_SOURCE) && pwd`

APT_INSTALL="${SRC_DIR}/install/_apt_install.sh"
CAGO_INSTALL="${SRC_DIR}/install/_cargo_install.sh"
UPDATE="${SRC_DIR}/_update.sh"

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

source $UPDATE
