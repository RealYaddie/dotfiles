#!/usr/bin/env bash

# Description: Simple script that creates a new wine prefix and installs dlls using winetricks.

prefix=$1
arch=$2
tricks=$3

WINEARCH="${arch}" WINEPREFIX="${$prefix}" winetricks -q corefonts "${tricks}"
