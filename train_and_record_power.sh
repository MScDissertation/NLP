#! bin/bash

#task_batch_seq_model
export TASK=MRPC
export BATCH_SIZE=32
export MAX_SEQ_LEN=128
export MODEL=bert-base-cased
if [ "$1" ]
then
  export TASK=$1
fi
if [ "$2" ]
then
  export BATCH_SIZE=$2
fi
if [ "$3" ]
then
  export MAX_SEQ_LEN=$3
fi
if [ "$4" ]
then
  export MODEL=$4
fi
sh nvidiasmi.sh ${TASK}_${BATCH_SIZE}_${MAX_SEQ_LEN} &
sh fine_tune_example.sh $TASK $BATCH_SIZE $MAX_SEQ_LEN $MODEL
echo "Exiting"
pkill nvidia-smi
echo "New power consumption recorded"
