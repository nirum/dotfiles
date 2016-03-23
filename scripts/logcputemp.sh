#!/bin/bash
while sleep 60;
do { echo -n $(date +%s); echo -n ","; echo -n $(sensors | sed -rn 's/^.* \+([0-9]+)\.[0-9].C .*/\1/p' | xargs | sed -e 's/ /,/g'); echo -n ","; echo $(nvidia-smi -q -d temperature | sed -rn 's/^.*GPU Current.*: ([0-9]+).*/\1/p' | xargs | sed -e 's/ /,/g'); } >> /home/nirum/Dropbox/temperature.log
done
