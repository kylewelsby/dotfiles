#!/usr/bin/env bash

echo -e "\033[0;32mInstalling Brew Cask Applications\033[0m"
run "brew cask install ${CASK_PROGRAMS}"
