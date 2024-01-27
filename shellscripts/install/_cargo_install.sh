#!/usr/bin/env bash

LIST=$(cat "$SRC_DIR/install_list/cargo_install.txt")

function install_cargo() {
    ARG=$1
    echo "Installing $ARG ..."
        cargo install -q --message-format human "$ARG" || return 1
        echo " -> Done"
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
    install_cargo "$pac"
done

