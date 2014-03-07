#!/bin/bash

if [ -d "$1" ]; then
	curl -kO https://raw.github.com/git/git/master/contrib/diff-highlight/diff-highlight
	mv -f diff-highlight "$1/"
else
	echo usage: download-diff-highlight.sh destination
fi

