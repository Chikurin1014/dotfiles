#!/usr/bin/env bash

SRC_DIR=`cd $(dirname $0) && pwd`

PATH_TO_INSTALLED="${SRC_DIR}/installation/.installed"
if [ ! -e "$PATH_TO_INSTALLED" ]; then

read -p "sudo password: " SUDO_PWD

bash -c "source \"$SRC_DIR/installation/_exec.sh\" \"$SUDO_PWD\""

touch "${SRC_DIR}/installation/.installed"

fi
