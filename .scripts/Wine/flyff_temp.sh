#!/usr/bin/env bash

WINEARCH=win32 WINEPREFIX=~/.flyff11-32Bit winetricks -q corefonts vcrun2015 dotnet472 d3d9
