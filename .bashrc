umask 022

export LANG=ja_JP.UTF-8
export TERM='xterm-256color'
export EDITOR=vim

export HISTCONTROL=ignoredups

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1='[\[\e[32m\]\u\[\e[00m\]@\[\e[36m\]\h\[\e[00m\]:\[\e[34m\]\W\[\e[00m\]]\$ '
if [ -f ~/git-completion.bash ]; then
	. ~/git-completion.bash
fi
if [ -f ~/git-prompt.sh ]; then
	export GIT_PS1_SHOWUPSTREAM=1
	export GIT_PS1_SHOWUNTRACKEDFILES=1
	export GIT_PS1_SHOWSTASHSTATE=1
	export GIT_PS1_SHOWDIRTYSTATE=1
	. ~/git-prompt.sh

	PS1='[\[\e[32m\]\u\[\e[00m\]@\[\e[36m\]\h\[\e[00m\]:\[\e[34m\]\W\[\e[00m\]$(__git_ps1)]\$ '
fi
export PS1

#PS1='color-test\n\
#	\[\e[0;30m\]black 0;30\[\e[00m\]\n\
#	\[\e[0;34m\]blue 0;34\[\e[00m\]\n\
#	\[\e[0;32m\]green 0;32\[\e[00m\]\n\
#	\[\e[0;36m\]cyan 0;36\[\e[00m\]\n\
#	\[\e[0;31m\]red 0;31\[\e[00m\]\n\
#	\[\e[0;35m\]purple 0;35\[\e[00m\]\n\
#	\[\e[0;33m\]dark yellow 0;33\[\e[00m\]\n\
#	\[\e[0;37m\]light gray 0;37\[\e[00m\]\n\
#	\[\e[1;30m\]dark gray 1;30\[\e[00m\]\n\
#	\[\e[1;34m\]light blue 1;34\[\e[00m\]\n\
#	\[\e[1;32m\]light green 1;32\[\e[00m\]\n\
#	\[\e[1;36m\]light cyan 1;36\[\e[00m\]\n\
#	\[\e[1;31m\]light red 1;31\[\e[00m\]\n\
#	\[\e[1;35m\]light purple 1;35\[\e[00m\]\n\
#	\[\e[1;33m\]yellow 1;33\[\e[00m\]\n\
#	\[\e[1;37m\]white 1;37\[\e[00m\]\n\
#	\$ '
#export PS1

export PROMPT_COMMAND='echo -ne "\033]0;$(whoami)@${HOSTNAME}:${PWD/$HOME/~}\007"'

function export_path ()
{
	if [ -d "$1" ]; then
		if [[ ! "$PATH" =~ "$1" ]]; then
			export PATH=$1:$PATH
		fi
	fi
}

export_path ~/local/bin
export_path ~/bin

uname=`uname`
case $uname in
	Darwin)
		. ~/.bashrc-alias-gnu ;
		. ~/.bashrc-macosx ;;
	Linux)
		. ~/.bashrc-alias ;
		. ~/.bashrc-linux ;;
	MINGW32*)
		. ~/.bashrc-alias ;
		. ~/.bashrc-windows ;;
esac

if [ -f ~/.bashrc-local ]; then
	. ~/.bashrc-local
fi

if [ -f ~/.bashrc-function ]; then
	. ~/.bashrc-function
fi

if [ -f ~/dircolors.256dark ]; then
	eval $(dircolors -b ~/dircolors.256dark)
fi
