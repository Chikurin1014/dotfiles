#!/usr/bin/env bash

[[ $1 == "No-Install" ]] && exit 0

echo "Updating apt packages ..."
sudo apt-get update -y > /dev/null 2>&1
echo " -> Done"
echo "Upgrading apt packages ..."
sudo apt-get upgrade -y > /dev/null 2>&1
echo " -> Done"

if [[  -e $(which rustup) ]]; then
    echo "Updating rustup ..."
    rustup update > /dev/null 2>&1
    echo " -> Done"
    echo "Updating cargo packages ..."
    cargo install-update --all > /dev/null 2>&1
    echo " -> Done"
else
    echo "Rust is not installed"
fi

echo ""
