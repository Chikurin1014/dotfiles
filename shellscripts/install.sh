#!/usr/bin/env bash

which mise > /dev/null && eval "$(mise activate bash)"

source "$SRC_DIR/shellscripts/install/mise_install.sh" $@
source "$SRC_DIR/shellscripts/install/apt_install.sh" $@
source "$SRC_DIR/shellscripts/install/cargo_install.sh" $@
