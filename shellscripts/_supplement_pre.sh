#!/usr/bin/env bash

# add mise repository to apt
function install_mise() {
    sudo install -dm 755 /etc/apt/keyrings
    wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1> /dev/null
    CPU_ARCH=$(uname -m)
    echo "CPU_ARCH: $CPU_ARCH"
    if [[ $CPU_ARCH = "x86_64" ]]; then
        echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=amd64] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
    elif [[ $CPU_ARCH = "arm64" ]]; then
        echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=arm64] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
    else
        return 1
    fi
    echo "Installing mise ..."
    sudo apt update > /dev/null 2>&1
    sudo apt install -y mise > /dev/null 2>&1
    echo " -> Done"
    eval "$(mise activate)"
    mkdir -p $HOME/.config/mise
    ln -s $SRC_DIR/files/.config/mise/config.toml $HOME/.config/mise/config.toml
    echo "Installing runtimes by mise ..."
    mise install -yq
}
if [[ $MODE != "No-Install" ]]; then
    which mise > /dev/null 2>&1 || install_mise
fi

# mise activate
if [[ $MODE != "No-Install" && $MODE = "Minimal" ]]; then
    touch "$HOME/.config/zsh/mise_activate.zsh"
    echo 'eval "$(mise activate)"' > "$HOME/.config/zsh/mise_activate.zsh"
fi
