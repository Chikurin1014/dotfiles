#!/usr/bin/env bash

LIST=$(cat "$SRC_DIR/install_list/apt_install.txt")

function install_apt() {
    arg=$1
    echo "Installing $arg ..."
    dpkg -l "$arg" > /dev/null 2>&1 && echo " -> Already installed" && return 1 # package is already installed
    sudo apt-get install -y "$arg" > /dev/null 2>&1 || echo " -> Not available in apt" && return 2 # package cannot be installed by apt
    echo " -> Done"
    return 0
}

# install packages by install_apt
echo "$LIST" | while read pac; do
    install_apt "$pac" || continue
done
