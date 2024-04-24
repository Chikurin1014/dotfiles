#!/usr/bin/env bash

if ! which wezterm > /dev/null; then

    echo "==== Add wezterm repository to apt ===="
    curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
    echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
    echo "======================================="
    echo ""
    echo "==== Install wezterm ===="
    sudo apt update > /dev/null 2>&1
    sudo apt install -y wezterm > /dev/null 2>&1
    echo "========================="

fi
