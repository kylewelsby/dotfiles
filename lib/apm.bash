#!/usr/bin/env bash


echo -e "\033[0;32mInstalling Atom.io Community Packages\033[0m"
run "/Applications/Atom.app/Contents/Resources/app/apm/bin/apm install ${APM_MODULES}"
