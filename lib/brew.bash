#!/usr/bin/env bash

source ./lib/heleprs.bash

set +e
which brew
if [[ $? != 0 ]]; then
  echo -e "\033[0;32mInstalling Homebrew\033[0m"
  brew_install='/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  run "$brew_install"
fi
set -e

brew_command=`which brew`
echo -e "\033[0;32mUpdating Homebrew\033[0m"
run "${brew_command} --version"
run "${brew_command} update"
run "${brew_command} --version"
echo -e "\033[0;32mInstalling Brew Libraries\033[0m"
run "${brew_command} install ${BREW_PROGRAMS} || true"
run "${brew_command} cleanup"
