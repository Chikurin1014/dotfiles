#!/usr/bin/env bash

which mise > /dev/null && eval "$(mise activate bash)"

# file exists
# shellcheck disable=SC1091
source "$SRC_DIR/shellscripts/install/mise_install.sh" "$@"
# file exists
# shellcheck disable=SC1091
source "$SRC_DIR/shellscripts/install/apt_install.sh" "$@"
# file exists
# shellcheck disable=SC1091
source "$SRC_DIR/shellscripts/install/cargo_install.sh" "$@"
# file exists
# shellcheck disable=SC1091
source "$SRC_DIR/shellscripts/install/tpm_install.sh" "$@"

