#!/usr/bin/env bash

JSON="$SRC_DIR/json/cargo_install.json"

function install_cargo() {
    ARG=$1
    echo "Installing $ARG ..."
    if [ -z "$(cargo install --list | grep "$ARG")" ]; then
        cargo install -q --message-format human "$ARG"
        echo " -> Done"
    else
        echo " -> Already exists"
    fi
}

# install rustup which includes cargo
# ref: https://www.rust-lang.org/ja/learn/get-started
if [ ! -e $(which rustup) ]; then
    echo "Installing rustup ..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    echo " -> Done"
else
    echo " -> Rustup already exists"
fi

# install packages by cargo
PACS=$(cat "$JSON" | jq -c '.[]')
for pac in "$PACS"; do
    install_cargo "$pac"
    echo ""
done
