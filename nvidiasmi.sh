#! bin/bash

export folder_name=/home/shivangi/BERT/nvidia
export file_name=nvidia_power
export new_fileName=${file_name}_${current_time}.csv
export current_time=`date +%s`
if [ "$1" ]
then 
    export new_fileName=${file_name}_$1.csv
fi

echo $new_fileName

nvidia-smi -l 5 -f ${folder_name}/${new_fileName} \
 --format=csv,nounits \
 --query-gpu=timestamp,utilization.gpu,utilization.memory,memory.total,memory.used,memory.free,temperature.gpu,power.draw,pstate
