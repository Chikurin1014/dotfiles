#!/usr/bin/env bash

# install packages by install_apt
echo "==== apt install ===="
echo "$APT_INSTALL_LIST" | while read pac; do
    install_apt "$pac" || continue
done
echo "======================"
echo ""
