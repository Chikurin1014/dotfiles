#!/usr/bin/env bash

if which home-manager > /dev/null 2>&1; then
    home-manager switch --flake ~/dotfiles -b bak
    exit $?
fi

if which nix > /dev/null 2>&1; then
    nix --extra-experimental-features nix-commands,flakes run home-manager switch -- --flake ~/dotfiles -b bak
    exit $?
fi

if which dotter > /dev/null 2>&1; then
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
