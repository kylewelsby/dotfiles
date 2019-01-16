#!/usr/bin/env bash


#### Settings ####

COMPUTER_NAME="MeKyle-osx"
DOT_FILES="
.aws
.bash_itrc
.bash_profile
.bashrc
.gitconfig
.gitignore.profiles.js
.inputrc
.npmrc
.ssh
"

BREW_PROGRAMS="
git
hugo
jq
mas
node
openssl
rbenv
ruby-build
ssh-copy-id
"

CASK_PROGRAMS="
1password
adobe-creative-cloud
aerial
alfred
atom
avast-secureline-vpn
bartender
blisk
caffeine
cleanmymac
dropbox
evernote
google-chrome
google-photos-backup-and-sync
grammarly
imageoptim
krisp
music-manager
muzzle
numi
rescuetime
sketch
skype
spectacle
the-unarchiver
whatsapp
"

APP_STORE_PROGRAMS="
Clean
Contrast
Spark
Todoist
Xcode
"

NPM_MODULES="
@vue/cli
gitignorer
outdated
serverless
standard
"

APM_MODULES="
emmet
language-gherkin
language-graphql
language-hugo
language-markdown
language-vue
linter
linter-js-standard
linter-ui-default
pigments
sort-lines
standard-formatter
"

BASH_IT_ALIAS="
bundler
general
git
osx
"

BASH_IT_COMPLETIONS="
bash-it
brew
brew
git
npm
rake
ssh
system
"

BASH_IT_PLUGINS="
extract
alias-completion
ruby
xterm
rbenv
"

#### Settings End #####


RED='\033[0;31m'
NC='\033[0m' # No Color
SCRIPT_PATH="`dirname \"$0\"`"

# Abort on error
set -e
source ./lib/heleprs.bash

function show_usage() {
  echo -e "\n$0 : Install the world"
  echo -e "Usage:\n$0 [arguments] \n"
  echo "Arguments:"
  echo "--help (-h): Display this help message"
  echo "--dry-run (-n): Dry run, don't run any commands";
  echo "--no-app-store (-m): Disables Mac App Store"
  echo "--no-brew-cask (-c): Disables Brew Cask Applications"
  echo "--no-modify-config (-f): Disables copying of config files"
  echo "--no-mac-defaults (-d): Disables default mac settings"
  exit 0;
}

enable_app_store=true
enable_brew_cask=true
enable_dot_files=true
enable_mac_defaults=true

for param in "$@"; do
  shift
  case "$param" in
    "--help")               set -- "$@" "-h" ;;
    "--no-app-store")       set -- "$@" "-m" ;;
    "--no-brew-cask")       set -- "$@" "-c" ;;
    "--no-modify-config")   set -- "$@" "-f" ;;
    "--no-mac-defaults")    set -- "$@" "-d" ;;
    "--dry-run")            set -- "$@" "-n" ;;
    *)                      set -- "$@" "$param"
  esac
done

OPTIND=1
while getopts "hmncfd" opt
do
  case "$opt" in
  "h") show_usage; exit 0 ;;
  "n") dry_run=true ;;
  "m") enable_app_store=false ;;
  "c") enable_brew_cask=false ;;
  "f") enable_dot_files=false ;;
  "d") enable_mac_defaults=false ;;
  "?") show_usage >&2; exit 1 ;;
  esac
done
shift $(expr $OPTIND - 1)

# Check for git
git_command=`find_command git`
# Check for curl
curl_command=`find_command curl`
# Check for ruby
ruby_command=`find_command ruby`

source ./lib/bash-it.bash

source ./lib/brew.bash

if [ "$enable_brew_cask" = true ]; then
  source ./lib/brew-cask.bash
fi

source ./lib/npm.bash
source ./lib/apm.bash

if [ "$enable_app_store" = true ]; then
  source ./lib/mac-app-store.bash
fi

if [ "$enable_dot_files" = true ]; then
  for filename in $DOT_FILES; do
    echo "# Copying ${filename}"
    from_file="${SCRIPT_PATH}/${filename}"
    to_file="${HOME}/${filename}"
    copy_file="cp -a ${from_file} ${to_file}"
    backup_file="cp -a ${to_file} ${to_file}.backup"
    if [ -e "${to_file}" ]; then
      run "$backup_file"
    fi
    run "$copy_file"
  done

  chmod 600 ~/.ssh/config
fi

if [ "$enable_mac_defaults" = true ]; then
  source ./lib/macos-defaults.bash
fi


# cleaning up
echo -e "\n${RED}Please relogin to see changes.${NC}"