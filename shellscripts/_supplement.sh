#!/usr/bin/env bash

mkdir -p ~/.local/bin

which batcat > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
    which bat > /dev/null 2>&1
    if [[ $? -eq 1 ]]; then
        ln -s /usr/bin/batcat ~/.local/bin/bat
    fi
fi
