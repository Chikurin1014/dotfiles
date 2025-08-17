#!/usr/bin/env bash

if which -s nix; then
    home-manager switch --flake ~/dotfiles -b bak
    exit $?
fi

if which -s dotter; then
    dotter deploy --force
    exit $?
fi

SRC_DIR=$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)

source "$SRC_DIR/sl-maker-for-dotfiles/run.sh" \
    -o "$SRC_DIR/files" \
    -d "$HOME" \
    -r "zshrc -> .zshrc" \
    -r "config/ -> .config/" \
    -r "clang-format -> .clang-format" \
    -r "gitconfig -> .gitconfig" \
    > "$SRC_DIR/sl-maker-for-dotfiles.log"
