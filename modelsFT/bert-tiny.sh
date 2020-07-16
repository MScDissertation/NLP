#! bin/bash

export MODEL=bert
export MODEL_CONFIG=mrm8488/bert-tiny-finetuned-squadv2
export BATCH_SIZE=1

export OUTPUT_DIR=/media/data/bert-tiny

export SQUAD_DIR=../SQUAD

if [ "$1" ]
then 
    export OUTPUT_DIR=$1
fi
mkdir $OUTPUT_DIR

if [ "$2" ]
then 
    export BATCH_SIZE=$2
fi


python ../transformers/examples/question-answering/run_squad.py \
    --model_type $MODEL \
    --model_name_or_path $MODEL_CONFIG \
    --do_train \
    --do_eval \
    --train_file $SQUAD_DIR/train-v2.0.json \
    --predict_file $SQUAD_DIR/dev-v2.0.json \
    --learning_rate 3e-5 \
    --num_train_epochs 1 \
    --output_dir $OUTPUT_DIR \
    --per_gpu_eval_batch_size=$BATCH_SIZE \
    --per_gpu_train_batch_size=$BATCH_SIZE  \
    --save_steps 10000 \
    --overwrite_output_dir