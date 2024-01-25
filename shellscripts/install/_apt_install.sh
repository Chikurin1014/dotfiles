#!/usr/bin/env bash

JSON="$SRC_DIR/json/apt_install.json" # json file which contains packages to install
JQ="jq" # jq is required to parse json

function install_apt() {
    arg=$1
    echo "Installing $arg ..."
    if [[ -z $(dpkg -l | grep "$arg") ]]; then
        sudo apt-get install -yqq "$arg"
        echo " -> Done"
    else
        echo " -> Already exists"
    fi
}

# install packages by install_apt
PACS=$(cat "$JSON" | jq -r '.[]')
for pac in "$PACS"; do
    install_apt "$pac"
    echo ""
done
