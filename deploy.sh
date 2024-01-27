#!/usr/bin/env bash

set -e

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)

# Perse options and set install mode
MODE=""
OPTIND=1
while getopts fmn opt
do
    case "$opt" in
    f)
        MODE="Full"
        ;;
    m)
        MODE="Minimal"
        ;;
    n)
        MODE="No-Install"
        ;;
    esac
done

if [[ $MODE == "" ]]; then
    echo "[Error] You must specify install mode"
    echo "Usage: ./deploy.sh [install-mode]"
    echo "install-mode:"
    echo "    -f: full"
    echo "    -m: minimal"
    echo "    -n: no-install"
    echo ""
    exit 1
fi

# ask sudo password at the beginning
sudo -v

# deploy
echo ""
echo "Install mode: $MODE"
echo ""
echo ""
source "$SRC_DIR/shellscripts/_update.sh" $MODE
source "$SRC_DIR/shellscripts/_install.sh" $MODE
source "$SRC_DIR/shellscripts/_link.sh"
echo "Done"
echo ""
