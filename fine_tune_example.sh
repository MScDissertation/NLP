#! bin/bash

export GLUE_DIR=data
export TASK=MRPC
export BATCH_SIZE=32
export MAX_SEQ_LEN=128
export MODEL=bert-base-cased
export LEARNING_RATE=2e-5
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
python ./transformers/examples/text-classification/run_glue.py \
  --model_name_or_path $MODEL \
  --task_name $TASK \
  --do_train \
  --do_eval \
  --data_dir $GLUE_DIR/$TASK/ \
  --max_seq_length $MAX_SEQ_LEN \
  --per_device_train_batch_size $BATCH_SIZE \
  --learning_rate $LEARNING_RATE \
  --num_train_epochs 3.0 \
  --output_dir /tmp/${TASK}_${BATCH_SIZE}_${MAX_SEQ_LEN}_output/ --overwrite_output_dir
