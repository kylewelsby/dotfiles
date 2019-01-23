# dotfiles

[![Build Status](https://travis-ci.org/kylewelsby/dotfiles.svg?branch=master)](https://travis-ci.org/kylewelsby/dotfiles)

> Setup script to install and configure a new macOS installation with my applications and system dependencies.

This has all my important dotfiles which define my working environment.

Automation install script inspired by [Jason Yu](https://github.com/ycmjason/dotfiles).

## 🎲 Installation

    git clone --depth=1 https://github.com/kylewelsby/dotfiles ~/.dotfiles
    ~/.dotfiles/install.sh

## 🛠 Useage

    Usage:
    ./install.sh [arguments]

    Arguments:
    --help (-h): Display this help message
    --dry-run (-r): Dry run, don't run any commands
    --no-app-store (-m): Disable Mac App Store
    --no-brew-cask (-c): Disable Brew Cask Applications
    --no-modify-config (-f): Disable copying of config files
    --no-mac-defaults (-d): Disable default mac settings
    --no-apm (-a): Disable Atom.io package manager
    --no-npm (-n): Disable Node package manager
    --no-bash-it (-i): Disable Bash.it
    --no-projects (-p): Disable git checkout for projects

## 🤖 Testing

Well, about that.  At the moment, to test this we need to run the script on our own machine.

## 🎓 License

MIT: https://kylewelsby.mit-license.org
