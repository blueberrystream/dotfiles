#!/bin/sh

curl -O https://raw2.github.com/git/git/master/contrib/completion/git-prompt.sh
curl -O https://raw2.github.com/git/git/master/contrib/completion/git-completion.bash
mv -f git-prompt.sh ~/
mv -f git-completion.bash ~/
cp -u git-completion-init.sh ~/
