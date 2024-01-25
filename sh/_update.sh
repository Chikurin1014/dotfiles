#!/usr/bin/env bash

sudo -v # ask sudo password at first

echo "Updating apt packages ..."
echo ""
sudo apt-get -y update
sudo apt-get -y upgrade

if [[  -e $(which rustup) ]]; then
    echo "Updating rustup ..."
    echo ""
    rustup update
    echo ""
    echo "Updating cargo packages ..."
    echo ""
    cargo install-update --all
    echo ""
else
    echo "Rust is not installed"
    echo ""
fi
