#!/bin/bash

if [ -d "$1" ]; then
	wget https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight
	mv -f diff-highlight "$1/"
	chmod 755 "$1"/diff-highlight
else
	echo usage: download-diff-highlight.sh destination
fi

