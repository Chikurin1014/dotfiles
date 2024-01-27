#!/usr/bin/env bash

mkdir -p ~/.local/bin

if [[ $(echo $SHELL) != $(which zsh) ]]; then
    echo "Changing login shell to zsh ..."
    chsh -s $(which zsh)
    echo " -> Done"
fi

which batcat > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
    which bat > /dev/null 2>&1
    if [[ $? -eq 1 ]]; then
        ln -s /usr/bin/batcat ~/.local/bin/bat
    fi
fi
