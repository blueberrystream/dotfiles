umask 022

export LANG=ja_JP.UTF-8
export TERM='xterm-256color'
export EDITOR=vim
export LESS='-g -i -M -R -S -W -z-4'
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.
LESSOPEN="|$HOME/local/bin/lesspipe.sh %s"; export LESSOPEN
export PAGER=less

export HISTCONTROL=ignoredups

# prohibit C-s
if type dircolors > /dev/null 2>&1; then
  stty stop undef
fi

# for git-prompt
export GIT_PS1_SHOWUPSTREAM=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWDIRTYSTATE=1

# load bash completion
bash_completion_dir=$HOME/local/etc/bash_completion.d
if [ -d $bash_completion_dir ]; then
  for file in $bash_completion_dir/*; do
    . ${file}
  done
fi

PS1='[\[\e[32m\]\u\[\e[00m\]@\[\e[36m\]\h\[\e[00m\]:\[\e[34m\]\W\[\e[00m\]$(__git_ps1)]\n\
`if [[ \$? = "0" ]]; then echo "\e[0;33m\]"; else echo "\[\e[0;35m\]"; fi`\
从✖  ｜ ＿ ｜✖从\[\e[00m\] < '

#PS1='color-test\n\
#  \[\e[0;30m\]black 0;30\[\e[00m\]\n\
#  \[\e[0;34m\]blue 0;34\[\e[00m\]\n\
#  \[\e[0;32m\]green 0;32\[\e[00m\]\n\
#  \[\e[0;36m\]cyan 0;36\[\e[00m\]\n\
#  \[\e[0;31m\]red 0;31\[\e[00m\]\n\
#  \[\e[0;35m\]purple 0;35\[\e[00m\]\n\
#  \[\e[0;33m\]dark yellow 0;33\[\e[00m\]\n\
#  \[\e[0;37m\]light gray 0;37\[\e[00m\]\n\
#  \[\e[1;30m\]dark gray 1;30\[\e[00m\]\n\
#  \[\e[1;34m\]light blue 1;34\[\e[00m\]\n\
#  \[\e[1;32m\]light green 1;32\[\e[00m\]\n\
#  \[\e[1;36m\]light cyan 1;36\[\e[00m\]\n\
#  \[\e[1;31m\]light red 1;31\[\e[00m\]\n\
#  \[\e[1;35m\]light purple 1;35\[\e[00m\]\n\
#  \[\e[1;33m\]yellow 1;33\[\e[00m\]\n\
#  \[\e[1;37m\]white 1;37\[\e[00m\]\n\
#  \[\e[0;33m\]从× ｜ ＿ ｜×从 < \[\e[00m\]'
export PS1

export PROMPT_COMMAND='echo -ne "\033]0;$(whoami)@${HOSTNAME}:${PWD/$HOME/~}\007"'

function export_path ()
{
  if [ -d "$1" ]; then
    if [[ ! "$PATH" =~ "$1" ]]; then
      export PATH=$1:$PATH
    fi
  fi
}

export_path $HOME/local/bin
export_path $HOME/bin

if [ -f $HOME/local/etc/enhancd/enhancd.sh ]; then
  export ENHANCD_COMMAND=ecd
  source $HOME/local/etc/enhancd/enhancd.sh
fi

uname=`uname`
case $uname in
  Darwin)
    . $HOME/.bashrc.d/alias ;
    . $HOME/.bashrc.d/alias-gnu ;
    . $HOME/.bashrc.d/macosx ;;
  Linux)
    . $HOME/.bashrc.d/alias ;
    . $HOME/.bashrc.d/linux ;;
  MINGW32*)
    . $HOME/.bashrc.d/alias ;
    . $HOME/.bashrc.d/windows ;;
esac

if [ -f $HOME/.bashrc.d/local ]; then
  . $HOME/.bashrc.d/local
fi
if [ -f $HOME/.bashrc.d/peco ]; then
  . $HOME/.bashrc.d/peco
fi
if [ -f $HOME/.bashrc.d/function ]; then
  . $HOME/.bashrc.d/function
fi

if [ -f $HOME/dircolors.256dark ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors -b $HOME/dircolors.256dark)
  fi
fi
