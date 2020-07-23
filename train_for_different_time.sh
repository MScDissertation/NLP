#! bin/bash
# 2 hours
export TASK=QQP
export time_duration="10 15 20 25 30 35 40 45 50 55 60"
for time in ${time_duration}; do
    sh nvidiasmi.sh ${TASK}_64_${time} &
    timeout ${time} sh fine_tune_example.sh $TASK 64 128
    echo "Exiting"
    pkill nvidia-smi
    echo "New power consumption recorded"
done
