 #!/bin/bash

 if [[ `nvidia-smi dmon -s u -c 1 | awk 'FNR == 3 { print $2 }'` -gt 0 ]]; then
 	echo "1"
 else 
 	echo "0"
 fi 
 
