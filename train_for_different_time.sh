#! bin/bash
# 2 hours
export TASK=QQP
export time_duration="10m 15m 20m 25m 30m 35m 40m 45m 50m 55m 60m"
for time in ${time_duration}; do
    sh nvidiasmi.sh ${TASK}_64_${time} &
    timeout ${time} sh fine_tune_example.sh $TASK 64 128
    echo "Exiting"
    pkill nvidia-smi
    echo "New power consumption recorded"
done
