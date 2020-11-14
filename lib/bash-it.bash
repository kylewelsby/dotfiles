#!/usr/bin/env bash

### To uninstall ###
#
# $ ~/.bash_it/uninstall.sh && rm -rf ~/.bash_it
#
### end ###

source ./lib/heleprs.bash

bash_it_git="Bash-it/bash-it"
bash_it_branch="master"
bash_it_location="${HOME}/.bash_it"
bash_it_clone="$git_command clone --depth=1 --branch=${bash_it_branch} https://github.com/$bash_it_git.git ${bash_it_location}"
bash_it_install="${HOME}/.bash_it/install.sh --silent --no-modify-config"

if [ ! -d $bash_it_location ]; then
  echo ""
  echo -e "\033[0;32mInstalling Bash-it\033[0m"
  run "rm -rf ${bash_it_location}"
  run "$bash_it_clone"
  run "$bash_it_install"
fi

if [ -z "$BASH_IT" ];
then
  BASH_IT="$HOME/.bash_it"
fi

echo ""
echo -e "\033[0;32mEnabling Bash-it aliases, completions, and plugins\033[0m"

source ~/.bash_it/lib/composure.bash
source ~/.bash_it/lib/utilities.bash
cite _about _param _example _group _author _version
source ~/.bash_it/lib/helpers.bash

# run "_bash-it-version"

run "bash-it enable alias ${BASH_IT_ALIAS}"
run "bash-it enable completion ${BASH_IT_COMPLETIONS}"
run "bash-it enable plugin ${BASH_IT_PLUGINS}"
