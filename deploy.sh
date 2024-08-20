#!/usr/bin/env bash

set -e
sudo echo "sudo password is remembered"

SRC_DIR=$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)

# deploy
source "$SRC_DIR/shellscripts/definition.sh" "$@"
source "$SRC_DIR/shellscripts/update_apt.sh" "$@"
source "$SRC_DIR/shellscripts/install.sh" "$@"
echo "Linking files"
source "$SRC_DIR/sl-maker-for-dotfiles/run.sh" \
    -o "$SRC_DIR/files" \
    -d "$HOME" \
    -r "zshrc -> .zshrc" \
    -r "config/ -> .config/" \
    > "$SRC_DIR/sl-maker.log"
source "$SRC_DIR/shellscripts/update_apt.sh" "$@"
echo "Done"
echo ""
