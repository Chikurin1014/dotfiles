#!/usr/bin/env bash

set -e

if [ ! -e "$HOME/.initialized" ]; then
    "$HOME/dotfiles/deploy.sh"
    touch "$HOME/.initialized"
fi

exec fish -l
