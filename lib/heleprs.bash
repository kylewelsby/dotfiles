#!/usr/bin/env bash

if [ "$1" == "--dry-run" ]; then
  echo "Dry run mode..."; echo
  DRY_RUN=1
fi

function run {
  echo "  > $1"
  if [ -z "$DRY_RUN" ]; then
    eval $1
  fi
}

function find_command {
  command -v git >/dev/null 2>&1 || {
    echo >&2 "git is required for this installation but can not be found.  Aborting.";
    exit 1;
  }
  echo `command -v $1`
}
