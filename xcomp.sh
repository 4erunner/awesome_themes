 
#!/bin/bash

if pgrep compton &>/dev/null; then #if pgrep xcompmgr &>/dev/null; then
    echo "1"
else
	echo "0"
fi