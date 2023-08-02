#!/usr/bin/env bash

SUDO_PWD="$1"

INSTALL_BY_APT=(
    "build-essential"
    "git"
    "ssh"
    "libssl-dev"
)

function install_apt() {
    ARG=$1
    if [ -z "`apt list --installed | grep "$ARG"`" ]; then
        echo "$SUDO_PWD" | sudo -S apt-get install -yq $ARG
    else
        echo "    already exists"
    fi
}

echo "Installing required packages..."

# install packages by install_apt
for pac in ${INSTALL_BY_APT[@]}
do
echo "$pac"
install_apt "$pac"
done

# update & upgrade packages
echo "Updating & Upgrading packages"

echo "$SUDO_PWD" | sudo -S apt-get -y update
echo "$SUDO_PWD" | sudo -S apt-get -y upgrade
