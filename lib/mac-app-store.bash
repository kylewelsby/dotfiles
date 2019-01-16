#!/usr/bin/env bash

until (mas account > /dev/null);
do
  echo -e "You are not yet logged into the Mac App Store."
  echo -e "I will launch the Mac App Store now."
  echo -e "\nPlease log in to the Mac App Store..."
  open -a "/Applications/App Store.app"
  until (mas account > /dev/null);
  do
  sleep 3
    echo -e "… zzz …."
  done
done

echo -e "\033[0;32mInstalling App Store Applications\033[0m"
for pname in $APP_STORE_PROGRAMS; do
 run "mas lucky ${pname}"
done
