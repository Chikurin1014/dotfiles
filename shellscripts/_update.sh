#!/usr/bin/env bash

[[ $MODE == "No-Install" ]] && return 0

echo "Updating apt packages ..."
sudo apt-get update -y > /dev/null 2>&1
echo " -> Done"
echo "Upgrading apt packages ..."
sudo apt-get upgrade -y > /dev/null 2>&1
echo " -> Done"

echo ""
