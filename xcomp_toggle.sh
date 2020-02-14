#!/bin/bash

#xcomp_exec=$( pgrep compton )
xcomp_exec=$( pgrep picom )

echo $xcomp_exec

if [ -z $xcomp_exec ]
then
    echo "Turning composer ON"
    picom --config ~/.config/awesome/compton.conf -r 0 -fC -l 0 -t 0 -D 1 -I 0.1 -O 0.1 & 
    # xcompmgr -nC &
else
    echo "Turning composerr OFF"
    pkill picom & 
    # pkill xcompmgr &
fi

exit 0

