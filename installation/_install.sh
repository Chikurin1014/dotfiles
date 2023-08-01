#!/usr/bin/env bash

SRC_DIR=`cd $(dirname $0) && pwd`

PATH_TO_INSTALLED="${SRC_DIR}/.installed"
if [ ! -e "$PATH_TO_INSTALLED" ]; then

echo "Please input sudo password to install required packages"
if [ -n "$ZSH_VERSION" ]; then
  read "SUDO_PWD?sudo password: "
else
  read -p "sudo password: " SUDO_PWD
fi

bash -c "source \"${SRC_DIR}/_exec.sh\" \"${SUDO_PWD}\""

touch "${PATH_TO_INSTALLED}"

fi
