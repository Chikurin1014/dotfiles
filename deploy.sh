#!/usr/bin/env bash

SRC_DIR=$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)

# Select the Home Manager configuration (see nix/home-manager/default.nix)
FLAKE_REF="$SRC_DIR"
if [ "$(uname -s)" = "Linux" ] && [ ! -e /etc/NIXOS ] \
    && ! grep -qi microsoft /proc/sys/kernel/osrelease 2> /dev/null; then
    # Linux distributions other than NixOS (not on WSL) need nixGL for GUI applications
    HM_USER=$(sed -n 's/^USER="\(.*\)"$/\1/p' "$SRC_DIR/.env")
    FLAKE_REF="$SRC_DIR#$HM_USER@generic-linux"
fi

if command -v home-manager > /dev/null 2>&1; then
    home-manager switch --flake "$FLAKE_REF" -b bak
    exit $?
fi

if command -v nix > /dev/null 2>&1; then
    # Use Home Manager pinned in flake.lock
    nix --extra-experimental-features nix-command \
        --extra-experimental-features flakes \
    run "$SRC_DIR#home-manager" -- switch --flake "$FLAKE_REF" -b bak
    exit $?
fi

if command -v dotter > /dev/null 2>&1; then
    cd "$SRC_DIR" || exit 1
    dotter deploy --force
    exit $?
fi

if [ ! -x "$SRC_DIR/sl-maker-for-dotfiles/run.sh" ]; then
    echo "An executable file \`sl-maker-for-dotfiles/run.sh\` is not found" >&2
    echo "Be sure to initialize & update git submodule by:" >&2
    echo "\`git submodule init && git submodule update\`" >&2
    exit 1
fi

echo "==== main ====" > "$SRC_DIR/sl-maker-for-dotfiles.log"
"$SRC_DIR/sl-maker-for-dotfiles/run.sh" \
    -o "$SRC_DIR/files" \
    -d "$HOME" \
    -r "config/ -> .config/" \
    -r "clang-format -> .clang-format" \
    -r "gitconfig -> .gitconfig" \
    -i "override/windows" \
    >> "$SRC_DIR/sl-maker-for-dotfiles.log"

echo "==== submodule: nvim-config ====" >> "$SRC_DIR/sl-maker-for-dotfiles.log"
"$SRC_DIR/sl-maker-for-dotfiles/run.sh" \
    -o "$SRC_DIR/nvim-config" \
    -d "$HOME/.config" \
    >> "$SRC_DIR/sl-maker-for-dotfiles.log"
