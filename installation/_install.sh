#!/usr/bin/env bash

SRC_DIR=`cd $(dirname $0) && pwd`

MODE="$1"

[[ $MODE == "normal" ]] && PATH_TO_EXECUTIVE="${SRC_DIR}/_exec.sh"
[[ $MODE == "minimal" ]] && PATH_TO_EXECUTIVE="${SRC_DIR}/_exec_minimal.sh"

PATH_TO_INSTALLED="${SRC_DIR}/.installed"
if [ ! -e "$PATH_TO_INSTALLED" ]; then

echo "Please input sudo password to install required packages"
if [ -n "$ZSH_VERSION" ]; then
  read -s "SUDO_PWD?sudo password: "
else
  read -sp "sudo password: " SUDO_PWD
fi

bash -c "\"${PATH_TO_EXECUTIVE}\"  \"${SUDO_PWD}\""

touch "${PATH_TO_INSTALLED}"

fi
