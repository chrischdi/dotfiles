#!/bin/bash

PW_PATH='social/github/chrischdi-personal-access-token'

echo "$PWD" | grep '/git.daimler.com' > /dev/null
if [[ $? == 0 ]]; then
  PW_PATH='work/git.daimler.com/schloc-token'
fi

pass $PW_PATH | head -n 1
