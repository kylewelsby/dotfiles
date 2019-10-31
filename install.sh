#!/usr/bin/env bash


#### Settings ####

COMPUTER_NAME="MeKyle-osx"
DOT_FILES="
.aws
.bash_itrc
.bash_profile
.bashrc
.bundle
.gitconfig
.gitignore.profiles.js
.inputrc
.npmrc
.ssh
"

BREW_PROGRAMS="
git
gnupg
hugo
jq
mas
node
openssl
rbenv
ruby-build
ssh-copy-id
gpg
watchman
yarn
"

CASK_PROGRAMS="
1password
adobe-creative-cloud
aerial
alfred
atom
bartender
caffeine
cleanmymac
dropbox
evernote
flux
google-chrome
google-photos-backup-and-sync
gpg-suite
grammarly
imageoptim
intel-power-gadget
istat-menus
iterm2
keybase
krisp
music-manager
muzzle
numi
postman
rescuetime
rocket
sketch
skype
spectacle
spotify
telegram
the-unarchiver
tower
transmit
whatsapp
yakyak
"

APP_STORE_PROGRAMS="
418412301
1254981365
1176895641
585829637
"

NPM_MODULES="
@vue/cli
gitignorer
outdated
serverless
standard
firebase-tools
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

GEM_RUBY_MODULES="
bundler
rubocop
"

enable_bash_it=true
enable_homebrew=true
enable_app_store=true
enable_brew_cask=true
enable_dot_files=true
enable_mac_defaults=true
enable_apm=true
enable_npm=true
enable_projects=true

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
  echo "--dry-run (-r): Dry run, don't run any commands";
  echo "--no-app-store (-m): Disable Mac App Store"
  echo "--no-brew-cask (-c): Disable Brew Cask Applications"
  echo "--no-modify-config (-f): Disable copying of config files"
  echo "--no-mac-defaults (-d): Disable default mac settings"
  echo "--no-apm (-a): Disable Atom.io package manager"
  echo "--no-npm (-n): Disable Node package manager"
  echo "--no-bash-it (-i): Disable Bash.it"
  echo "--no-projects (-p): Disable git checkout for projects"
  exit 0;
}



for param in "$@"; do
  shift
  case "$param" in
    "--help")               set -- "$@" "-h" ;;
    "--no-bash-it")         set -- "$@" "-i" ;;
    "--no-app-store")       set -- "$@" "-m" ;;
    "--no-brew")            set -- "$@" "-b" ;;
    "--no-brew-cask")       set -- "$@" "-c" ;;
    "--no-modify-config")   set -- "$@" "-f" ;;
    "--no-mac-defaults")    set -- "$@" "-d" ;;
    "--no-apm")             set -- "$@" "-a" ;;
    "--no-npm")             set -- "$@" "-n" ;;
    "--no-projects")             set -- "$@" "-p" ;;
    "--dry-run")            set -- "$@" "-r" ;;
    *)                      set -- "$@" "$param"
  esac
done

OPTIND=1
while getopts "hmncfdarbip" opt
do
  case "$opt" in
  "h") show_usage; exit 0 ;;
  "r") dry_run=true ;;
  "i") enable_bash_it=false ;;
  "m") enable_app_store=false ;;
  "b") enable_homebrew=false ;;
  "c") enable_brew_cask=false ;;
  "f") enable_dot_files=false ;;
  "d") enable_mac_defaults=false ;;
  "a") enable_apm=false ;;
  "n") enable_npm=false ;;
  "p") enable_projects=false ;;
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

if [ "$enable_bash_it" = true ]; then
  source ./lib/bash-it.bash
fi

if [ "$enable_homebrew" = true ]; then
  source ./lib/brew.bash
fi

if [ "$enable_brew_cask" = true ]; then
  source ./lib/brew-cask.bash
fi

if [ "$enable_npm" = true ]; then
  source ./lib/npm.bash
fi

if [ "$enable_apm" = true ]; then
  echo 'hi'
  source ./lib/apm.bash
fi

if [ "$enable_app_store" = true ]; then
  source ./lib/mac-app-store.bash
fi

if [ "$enable_dot_files" = true ]; then
  echo -e "\033[0;32mCopying dotfiles\033[0m"

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

  if [ -f ~/.ssh/config ]; then
    chmod 600 ~/.ssh/config
  fi
fi

if [ "$enable_mac_defaults" = true ]; then
  source ./lib/macos-defaults.bash
fi

if [ "$enable_projects" = true ]; then
  source ./lib/projects.bash
fi

# cleaning up
echo -e "\n${RED}Please relogin to see changes.${NC}"
