#!/bin/bash

PW_PATH='social/github/chrischdi-personal-access-token'

git remote -v | grep '/git.daimler.com' > /dev/null
if [[ $? == 0 ]]; then
  PW_PATH='work/git.daimler.com/schloc-token'
fi
git remote -v | grep 'https://git.cschlotter.de' > /dev/null
if [[ $? == 0 ]]; then
  PW_PATH='home/git.cschlotter.de/work-token'
fi

pass $PW_PATH | head -n 1
