#!/usr/bin/env bash

function install_apt() {
    arg=$1
    echo "Installing $arg"
    dpkg -l "$arg" > /dev/null 2>&1 && echo "  -> Already installed" && return 1 # package is already installed
    sudo apt-get install -y "$arg" > /dev/null 2>&1 || echo "  -> Not available in apt" && return 2 # package cannot be installed by apt
    return 0
}

function install_cargo() {
    arg=$1
        echo "Installing $arg"
        cargo install "$arg" > /dev/null 2>&1 || (echo "  -> Not available in cargo" && return 1) # package cannot be installed by cargo
        return 0
}
