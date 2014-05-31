if [ -f /etc/profile ]; then
	. /etc/profile
fi
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
if [ -f $HOME/.bashrc ]; then
	. $HOME/.bashrc
fi
