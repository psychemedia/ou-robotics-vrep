#!/usr/bin/env bash

#Install base python packages
#apt-get update && apt-get install -y ubuntu-desktop && apt-get clean
apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop && apt-get install -y gnome-terminal unity-lens-applications unity-lens-files && apt-get clean