umask 022

export LANG=ja_JP.UTF-8
export TERM=screen-256color
export EDITOR=vim
export PAGER=less

# http://qiita.com/delphinus/items/b04752bb5b64e6cc4ea9
export LESS='-g -i -M -R -S -W -z-4 -x2 -j10'
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.
if type lesspipe.sh > /dev/null; then
  export LESSOPEN='| $HOME/local/bin/lesspipe.sh %s'
fi

export HISTCONTROL=ignoredups

# prohibit C-s
stty stop undef

# for git-prompt
export GIT_PS1_SHOWUPSTREAM=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWDIRTYSTATE=1

# load bash completion
# bash_completion_dir=$HOME/local/etc/bash_completion.d
# if [ -d $bash_completion_dir ]; then
#   for file in $bash_completion_dir/*; do
#     . ${file}
#   done
# fi

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

if [ -f $HOME/.enhancd/enhancd/init.sh ]; then
  export ENHANCD_COMMAND=ecd
  export ENHANCD_FILTER=peco:fzf
  source $HOME/.enhancd/enhancd/init.sh
fi

uname=`uname`
case $uname in
  Darwin)
    . $HOME/.bashrc.d/alias ;
    # . $HOME/.bashrc.d/alias-gnu ;
    . $HOME/.bashrc.d/macosx ;
    . $HOME/.bashrc.d/ssh-agent ;
    . $HOME/.bashrc.d/gpg-agent ;;
  Linux)
    . $HOME/.bashrc.d/alias ;
    . $HOME/.bashrc.d/linux ;
    . $HOME/.bashrc.d/ssh-agent ;
    . $HOME/.bashrc.d/gpg-agent ;;
  MINGW32*)
    . $HOME/.bashrc.d/alias ;
    . $HOME/.bashrc.d/windows ;;
esac

if [ -f $HOME/.anyenv/bin/anyenv ]; then
  export_path $HOME/.anyenv/bin
  eval "$(anyenv init -)"
fi

if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

export GOPATH=$HOME/local/gopath
export_path $GOPATH/bin

[[ -f $HOME/.cda/cda/cda.sh ]] && . $HOME/.cda/cda/cda.sh

[[ -f $HOME/.bashrc.d/cargo ]] && . $HOME/.bashrc.d/cargo
[[ -f $HOME/.bashrc.d/local ]] && . $HOME/.bashrc.d/local
[[ -f $HOME/.bashrc.d/peco ]] && . $HOME/.bashrc.d/peco
[[ -f $HOME/.bashrc.d/function ]] && . $HOME/.bashrc.d/function

if [ -f $HOME/dircolors.256dark ]; then
  if type dircolors > /dev/null 2>&1; then
    eval $(dircolors -b $HOME/dircolors.256dark)
  fi
fi

### Bash-it https://github.com/Bash-it/bash-it ###
# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
#export BASH_IT_THEME='bobby'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
#export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
#export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source $BASH_IT/bash_it.sh
