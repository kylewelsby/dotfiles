#!/usr/bin/env bash

echo -e "\033[0;32mInstalling App Store Applications\033[0m"
for pname in $APP_STORE_PROGRAMS; do
 run "mas lucky ${pname}"
done
