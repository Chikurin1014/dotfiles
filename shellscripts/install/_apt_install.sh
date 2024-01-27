#!/usr/bin/env bash

LIST=$(cat "$SRC_DIR/install_list/apt_install.txt")

function install_apt() {
    arg=$1
    apt-cache show "$arg" > /dev/null 2>&1 || return 1
    [[ ! $(dpkg -l "$arg") = "dpkg-query: no pakcages found matching $arg" ]] && return 2
    echo "Installing $arg ..."
    sudo apt-get install -yqq "$arg"
    echo " -> Done"
    echo ""
    return 0
}

# install packages by install_apt
echo "$LIST" | while read pac; do
    install_apt "$pac" || continue
done
