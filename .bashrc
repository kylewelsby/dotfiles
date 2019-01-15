set filec
set autolist
set nobeep

# source the bash_it settings, bash_it uses rm, so have to call those functions before disabling rm
if [ -f ~/.bash_itrc ]; then
  source ~/.bash_itrc
fi

force_color_prompt=yes



# Tell ls to be colourful
export TERM=xterm-256color # quit vim without leaving stuff on screen
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export LC_ALL="en_US.utf-8"
export LANG="$LC_ALL"

export EDITOR="/usr/local/bin/atom -nw"
