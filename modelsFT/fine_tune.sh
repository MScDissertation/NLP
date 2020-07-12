#! bin/bash

#model_batch_layers
export MODEL=bert
export BATCH_SIZE=16
export LAYERS=12
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
  export LAYERS=$3
fi
sh nvidiasmi.sh ${MODEL}_${BATCH_SIZE}_${LAYERS} &
sh ${MODEL}.sh $BATCH_SIZE ${LAYERS}
echo "Exiting"
pkill nvidia-smi
echo "New power consumption recorded"
