#!/usr/bin/env bash

mkdir -p ~/Code/Clients/notch-communications-ltd
mkdir -p ~/Code/Projects
mkdir -p ~/Code/Scratch

while [ ! -f ~/.ssh/id_rsa ]
do
  echo -e "Your id_rsa is not present"
  echo -e "You'll need to put this file into place from your vault"
  echo -e "Don't worry, I'll wait..."
  echo -e "Here, let me help you. I'll open 1Password for you"
  open -a "/Applications/1Password 7.app"
  while [ ! -f ~/.ssh/id_rsa ]
  do
    sleep 3
  done
done

if [ -f ~/.ssh/id_rsa ]; then
  echo -e "\033[0;32mCloning Git Repositories\033[0m"
  if [ ! -d ~/Code/Projects/soulectiontracklists.com ]; then
    git clone git@github.com:kylewelsby/soulectiontracklists.com.git ~/Code/Projects/soulectiontracklists.com
  fi
  if [ ! -d ~/Code/Projects/api-node.tracklists.io ]; then
    git clone git@github.com:kylewelsby/track-finder.git ~/Code/Projects/api-node.tracklists.io
  fi
  if [ ! -d ~/Code/Projects/mekyle.com ]; then
    git clone git@github.com:kylewelsby/mekyle.com.git ~/Code/Projects/mekyle.com
  fi
else
  echo -e "\033[0;31m"
  echo -e "Your id_rsa is not present."
  echo -e "Could not checkout some git repositories."
  echo -e "\033[0m"
fi
