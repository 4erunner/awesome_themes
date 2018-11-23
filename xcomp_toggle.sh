#!/bin/bash

xcomp_exec=$( pgrep xcompmgr )

echo $xcomp_exec

if [ -z $xcomp_exec ]
then
    echo "Turning xcompmgr ON"
    xcompmgr -nC &
else
    echo "Turning xcompmgr OFF"
    pkill xcompmgr &
fi

exit 0

