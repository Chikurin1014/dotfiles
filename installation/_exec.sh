#!/usr/bin/env bash

SUDO_PWD="$1"

function install_apt() {
    ARG=$1
    if [ -z "`apt list --installed | grep "$ARG"`" ]; then
        echo "$SUDO_PWD" | sudo -S apt-get install -yq $ARG
    else
        echo "    already exists"
    fi
}

function install_cargo() {
    ARG=$1
    if [ -z "`cargo install --list | grep "$ARG"`" ]; then
        echo "$SUDO_PWD" | sudo -S cargo install -q --message-format human "$ARG"
    else
        echo "    already exists"
    fi
}

INSTALL_BY_APT=(
    "build-essential"
    "git"
    "ssh"
    "libssl-dev"
)

INSTALL_BY_CARGO=(
    "cargo-update"
    "cargo-generate"
    "sheldon"
    "starship"
    "lsd"
)

echo "Installing required packages..."

# install packages by install_apt
for pac in ${INSTALL_BY_APT[@]}
do
echo "$pac"
install_apt "$pac"
done

# install rustup which includes cargo
# ref: https://www.rust-lang.org/ja/learn/get-started
echo "rustup"
if [ ! -e `which rustup` ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
else
    echo "    already exists"
fi

# install packages by cargo
for pac in ${INSTALL_BY_CARGO[@]}
do
echo "$pac"
install_cargo "$pac"
done

# update & upgrade packages
echo "Updating & Upgrading packages"

echo "$SUDO_PWD" | sudo -S apt-get -y update
echo "$SUDO_PWD" | sudo -S apt-get -y upgrade
echo "$SUDO_PWD" | sudo -S cargo install-update --all
