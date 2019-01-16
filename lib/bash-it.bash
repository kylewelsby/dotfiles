#!/usr/bin/env bash

source ./lib/heleprs.bash

bash_it_git="Bash-it/bash-it"
bash_it_location="${HOME}/.bash_it"
bash_it_clone="$git_command clone --depth=1 https://github.com/$bash_it_git.git ${bash_it_location}"
bash_it_install="${HOME}/.bash_it/install.sh --silent --no-modify-config"
if [ ! -d $bash_it_location ]; then
  echo "# Installing Bash-it"
  run "rm -rf ${bash_it_location}"
  run "$bash_it_clone"
  run "$bash_it_install"

fi

echo "# Enabling Bash-it aliases, completions, and plugins"
source ${bash_it_location}/lib/composure.bash
source ${bash_it_location}/lib/utilities.bash
cite _about _param _example _group _author _version
source ${bash_it_location}/lib/helpers.bash
run "bash-it enable alias ${BASH_IT_ALIAS}"
run "bash-it enable completion ${BASH_IT_COMPLETIONS}"
run "bash-it enable plugin ${BASH_IT_PLUGINS}"
