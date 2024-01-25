#!/usr/bin/env bash

sudo -v # ask sudo password at first

INSTALL_BY_APT=(
    "build-essential"
    "git"
    "ssh"
    "libssl-dev"
)

function install_apt() {
    ARG=$1
    if [ -z "$(dpkg -l | grep "$ARG")" ]; then
        sudo apt-get install -yq $ARG
    else
        echo "    already exists"
    fi
}

# install packages by install_apt
echo "Installing apt packages ..."
echo ""
for pac in ${INSTALL_BY_APT[@]}
do
echo "Installing $pac ..."
install_apt "$pac"
echo ""
done

echo ""
