#! bin/bash

sh nvidiasmi.sh pretrain &
sh pre_train.sh
echo "Exiting"
pkill nvidia-smi
echo "New power consumption recorded"
