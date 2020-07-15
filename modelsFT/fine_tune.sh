#! bin/bash

#model_batch_layers
export MODEL=bert
export BATCH_SIZE=16
export OUTPUT_DIR=/media/data
if [ "$1" ]
then
  export MODEL=$1
fi
if [ "$2" ]
then
  export BATCH_SIZE=$2
fi
if [ "$3" ]
then
  export OUTPUT_DIR=$3
fi
sh nvidiasmi.sh ${MODEL}_${BATCH_SIZE} &
sh ${MODEL}.sh $OUTPUT_DIR $BATCH_SIZE
echo "Exiting"
pkill nvidia-smi
echo "New power consumption recorded"
