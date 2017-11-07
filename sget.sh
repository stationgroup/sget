#!/bin/bash

function getsecurefile() {
# cd to appropriate directory
wget -q $1
wget -q $2
fname=`basename $1`
if minisign -Vm $fname -P RWSmY4o5Bad1vS60aYAiQUswWYVV2EuSdqc3ry7CWWF1E6bVbFG9kR/y >/dev/null ; then
echo DEBUG: downloaded valid file $fname
return 0
fi
# File failed signature check ....
echo DEBUG: downloaded file $fname failed signature check
mv $fname $fname.minisig /tmp
return 1
}

sget $1 $2
