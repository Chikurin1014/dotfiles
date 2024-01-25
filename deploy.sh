#!/usr/bin/env bash

SRC_DIR=$(cd $(dirname $BASH_SOURCE) && pwd)

# Perse options and set install mode
MODE=""
OPTIND=1
while getopts fm opt
do
    case "$opt" in
    f)
        MODE="Full"
        ;;
    m)
        MODE="Minimal"
        ;;
    esac
done

if [[ $MODE == "" ]]; then
    echo "[Error] You must specify install mode"
    echo "Usage: ./deploy.sh [install-mode]"
    echo "install-mode:"
    echo "    -f: full"
    echo "    -m: minimal"
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
source "$SRC_DIR/shellscripts/_install.sh" $MODE
source "$SRC_DIR/shellscripts/_link.sh"
source "$SRC_DIR/shellscripts/_update.sh"
echo "Done"
echo ""
