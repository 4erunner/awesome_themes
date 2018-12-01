 #!/bin/bash

 if cat /proc/acpi/bbswitch | grep ON &>/dev/null; then
 	echo "1"
 else 
 	echo "0"
 fi 
 