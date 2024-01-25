#!/usr/bin/env bash

INSTALL_BY_CARGO=(
    "cargo-update"
    "cargo-generate"
    "sheldon"
    "starship"
    "lsd"
)

function install_cargo() {
    ARG=$1
    if [ -z "$(cargo install --list | grep "$ARG")" ]; then
        cargo install -q --message-format human "$ARG"
    else
        echo "    already exists"
    fi
}

# install rustup which includes cargo
# ref: https://www.rust-lang.org/ja/learn/get-started
if [ ! -e $(which rustup) ]; then
    echo "Installing rustup ..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
else
    echo "Rustup already exists"
fi
echo ""

# install packages by cargo
echo "Installing cargo packages ..."
echo ""
for pac in ${INSTALL_BY_CARGO[@]}
do
echo "Installing $pac ..."
install_cargo "$pac"
echo ""
done

