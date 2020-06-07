#! bin/bash

export folder_name=/home/shivangi/BERT/nvidia
export file_name=nvidia_power
export current_time=`date +%s`
export new_fileName=${file_name}_${current_time}.csv
echo $new_fileName

nvidia-smi -l 5 -f ${folder_name}/${new_fileName} \
 --format=csv,nounits \
 --query-gpu=timestamp,utilization.gpu,utilization.memory,memory.total,memory.used,memory.free,power.draw
