#!/usr/bin/env bash

which mise > /dev/null && return 0

# add mise repository to apt
echo "==== Add mise repository to apt ===="
echo "CPU architecture: $CPU_ARCH"
sudo install -dm 755 /etc/apt/keyrings
wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1> /dev/null
if [[ $CPU_ARCH = "x86_64" ]]; then
    echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=amd64] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
elif [[ $CPU_ARCH = "arm64" ]]; then
    echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=arm64] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
else
    echo "Unsupported CPU architecture: $CPU_ARCH"
    exit 1
fi
echo "===================================="
echo ""

# install mise
echo "==== Install mise ===="
sudo apt update > /dev/null 2>&1
sudo apt install -y mise > /dev/null 2>&1
echo "======================"
echo ""

# activate mise and install runtimes
echo "==== Activate mise and install runtimes ===="
eval "$(mise activate)"
mkdir -p $HOME/.config/mise
ln -s $SRC_DIR/files/.config/mise/config.toml $HOME/.config/mise/config.toml
echo "Installing runtimes by mise ..."
mise install -yq
echo "============================================"
echo ""

