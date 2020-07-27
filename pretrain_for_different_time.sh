#! bin/bash
# 4 hours

export time_duration="4h"
for time in ${time_duration}; do
    sh nvidiasmi.sh pretrain_large_${time_duration} &
    timeout ${time} sh pretrain_large.sh ${time}
    echo "Exiting"
    pkill nvidia-smi
    echo "New power consumption recorded"
done
