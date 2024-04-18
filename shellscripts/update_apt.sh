#!/usr/bin/env bash

echo "Updating apt packages"
sudo apt-get update -y > /dev/null 2>&1
echo "Upgrading apt packages"
sudo apt-get upgrade -y > /dev/null 2>&1
echo ""
