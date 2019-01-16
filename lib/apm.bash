#!/usr/bin/env bash

which apm
if [[ $? == 0 ]]; then
  echo -e "\033[0;32mInstalling Atom.io Community Packages\033[0m"
  run "apm install ${APM_MODULES}"
fi
