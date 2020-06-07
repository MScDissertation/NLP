#! bin/bash

export GLUE_DIR=data

python ./transformers/examples/text-classification/run_glue.py \
  --model_name_or_path bert-base-cased \
  --task_name MRPC \
  --do_train \
  --do_eval \
  --data_dir $GLUE_DIR/MRPC/ \
  --max_seq_length 128 \
  --per_device_train_batch_size 32 \
  --learning_rate 2e-5 \
  --num_train_epochs 3.0 \
  --output_dir /tmp/mrpc_output/ --overwrite_output_dir
