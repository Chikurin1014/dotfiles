#!/usr/bin/env bash

mkdir -p ~/.local/bin

if [[ $(echo $SHELL) != $(which zsh) ]]; then
    echo "Changing login shell to zsh ..."
    chsh -s $(which zsh)
    echo " -> Done"
fi

