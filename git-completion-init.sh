#!/bin/bash

wget https://raw2.github.com/git/git/master/contrib/completion/git-prompt.sh
wget https://raw2.github.com/git/git/master/contrib/completion/git-completion.bash
mv -f git-prompt.sh ~/
mv -f git-completion.bash ~/
#cp -f git-completion-init.sh ~/
