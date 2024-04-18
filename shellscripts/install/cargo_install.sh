#!/usr/bin/env bash

# install rustup which includes cargo
# ref: https://www.rust-lang.org/ja/learn/get-started
if [[ ! -e $(which rustup) ]]; then
    echo "==== Install rustup ===="
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    . "$HOME/.cargo/env"
    echo "========================"
    echo ""
fi

# install packages by cargo
echo "==== cargo install ===="
echo "$CARGO_INSTALL_LIST" | while read pac; do
    install_cargo "$pac" || continue
done
echo "======================="
echo ""

