#!/usr/bin/env bash

LIST=$(cat "$SRC_DIR/install_list/cargo_install.txt")

function install_cargo() {
    arg=$1
        echo "Installing $arg ..."
        [[ -e $(cargo install --list | grep -e "^$arg") ]] && echo " -> Already installed" && return 1 # package is already installed
        cargo install "$arg" > /dev/null 2>&1 || (echo " -> Not available in cargo" && return 2) # package cannot be installed by cargo
        echo " -> Done"
        return 0
}

# install rustup which includes cargo
# ref: https://www.rust-lang.org/ja/learn/get-started
if [ ! -e $(which rustup) ]; then
    echo "Installing rustup ..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    echo " -> Done"
fi

# install packages by cargo
echo "$LIST" | while read pac; do
    install_cargo "$pac" || continue
done

