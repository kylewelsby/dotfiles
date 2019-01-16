#!/usr/bin/env bash

mas account
if [ $? -ne 0 ]; then
  echo "\033[0;31mApp Store not Signed in\033[0m"
else
  echo -e "\033[0;32mInstalling App Store Applications\033[0m"
  for pname in $APP_STORE_PROGRAMS; do
   run "mas lucky ${pname}"
  done
fi
