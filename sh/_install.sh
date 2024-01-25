#!/usr/bin/env bash

SRC_DIR=`cd $(dirname $BASH_SOURCE) && pwd`

APT_INSTALL="${SRC_DIR}/install/_apt_install.sh"
CAGO_INSTALL="${SRC_DIR}/install/_cargo_install.sh"
UPDATE="${SRC_DIR}/_update.sh"

MODE="$1"

if [[ $MODE == "Full" ]]; then
    source $APT_INSTALL
    source $CAGO_INSTALL
elif [[ $MODE == "Minimal" ]];then
    source $APT_INSTALL
else
    exit 1
fi

source $UPDATE
