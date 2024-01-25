#!/usr/bin/env bash

sudo -v # ask sudo password at first

echo "Updating apt packages ..."
sudo apt-get -yqq update
echo ""
echo "Upgrading apt packages ..."
sudo apt-get -yqq upgrade
echo " -> Done"
echo ""

if [[  -e $(which rustup) ]]; then
    echo "Updating rustup ..."
    rustup update
    echo " -> Done"
    echo ""
    echo "Updating cargo packages ..."
    cargo install-update --all -q
    echo " -> Done"
    echo ""
else
    echo "Rust is not installed"
    echo ""
fi
