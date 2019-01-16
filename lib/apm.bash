#!/usr/bin/env bash

echo -e "\033[0;32mInstalling Atom.io Community Packages\033[0m"
run "apm install --global ${NPM_MODULES}"
