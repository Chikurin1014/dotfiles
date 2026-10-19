#!/usr/bin/env bash

SRC_DIR=$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)

case "$(uname -s)" in
    MINGW* | MSYS* | CYGWIN*)
        echo "Use deploy.ps1 on Windows" >&2
        exit 1
        ;;
esac

# Initialize git submodules which are not initialized yet (e.g. nvim-config read by the flake).
# Initialized ones are left as is not to discard local changes.
git -C "$SRC_DIR" submodule status | awk '/^-/ { print $2 }' \
    | xargs -r git -C "$SRC_DIR" submodule update --init --

# Select the Home Manager configuration (see nix/home-manager/default.nix)
FLAKE_REF="$SRC_DIR"
if [ "$(uname -s)" = "Linux" ] && [ ! -e /etc/NIXOS ] \
    && ! grep -qi microsoft /proc/sys/kernel/osrelease 2> /dev/null; then
    # Linux distributions other than NixOS (not on WSL) need GPU drivers for GUI applications
    # The configuration is named after the user (`username` in user.toml), who runs this script
    FLAKE_REF="$SRC_DIR#$(id -un)@generic-linux"
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

# ---- Without Nix: deploy the dotfiles with the Dotter binary and install the tools with mise ----

set -eu
cd "$SRC_DIR"

download() {
    if command -v curl > /dev/null 2>&1; then
        curl -fsSL -o "$2" "$1"
    elif command -v wget > /dev/null 2>&1; then
        wget -q -O "$2" "$1"
    else
        echo "curl or wget is required" >&2
        return 1
    fi
}

sha256_of() {
    if command -v sha256sum > /dev/null 2>&1; then
        sha256sum "$1" | cut -d ' ' -f 1
    else
        shasum -a 256 "$1" | cut -d ' ' -f 1
    fi
}

# Print the path to the Dotter binary pinned in .dotter/manifest.toml (Dotter installed elsewhere is not used)
dotter_command() {
    local asset
    case "$(uname -s)/$(uname -m)" in
        Linux/x86_64 | Linux/amd64) asset="dotter-linux-x64-musl" ;;
        Linux/aarch64 | Linux/arm64) asset="dotter-linux-arm64-musl" ;;
        Darwin/arm64) asset="dotter-macos-arm64.arm" ;;
        *)
            echo "Dotter has no binary for $(uname -s)/$(uname -m): install Nix" >&2
            return 1
            ;;
    esac

    local manifest=".dotter/manifest.toml" version sha256
    version=$(sed -n 's/^version = "\(.*\)"$/\1/p' "$manifest")
    sha256=$(sed -n "s/^\"$asset\" = \"\(.*\)\"$/\1/p" "$manifest")
    if [ -z "$version" ] || [ -z "$sha256" ]; then
        echo "$manifest has no version or SHA-256 for $asset" >&2
        return 1
    fi

    # Download the binary unless the one downloaded before matches the manifest
    local bin=".dotter/bin/dotter"
    if [ ! -x "$bin" ] || [ "$(sha256_of "$bin")" != "$sha256" ]; then
        echo "Downloading Dotter $version ($asset)" >&2
        mkdir -p "$(dirname "$bin")"
        download "https://github.com/SuperCuber/dotter/releases/download/$version/$asset" "$bin.tmp"
        if [ "$(sha256_of "$bin.tmp")" != "$sha256" ]; then
            echo "Checksum mismatch for $asset" >&2
            rm -f "$bin.tmp"
            return 1
        fi
        chmod +x "$bin.tmp"
        mv "$bin.tmp" "$bin"
    fi
    echo "$SRC_DIR/$bin"
}

if [ ! -e .dotter/local.toml ]; then
    echo "Creating .dotter/local.toml" >&2
    printf '%s\n' 'includes = [".dotter/unix.toml"]' 'packages = ["default", "unix"]' > .dotter/local.toml
fi

# Some templates read user.toml by a path relative to the repository root
DOTTER=$(dotter_command)
"$DOTTER" deploy --force --noconfirm

# Install mise if needed (https://mise.jdx.dev/installing-mise.html), then the tools in its global config
MISE=$(command -v mise || echo "$HOME/.local/bin/mise")
if [ ! -x "$MISE" ]; then
    echo "Installing mise" >&2
    installer=$(mktemp)
    download https://mise.run "$installer"
    sh "$installer"
    rm -f "$installer"
fi
(cd "$HOME" && "$MISE" install --yes)
