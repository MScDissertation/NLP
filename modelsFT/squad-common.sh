#! bin/bash

export MODEL=bert
export MODEL_CONFIG=bert-base-uncased
export BATCH_SIZE=1

export SQUAD_DIR=../SQUAD
if ["$1"]
then
    export MODEL=$1
fi
if ["$2"]
then
    export MODEL_CONFIG=$2
fi
if [ "$3" ]
then 
    export BATCH_SIZE=$3
fi

export OUTPUT_DIR=/media/data/$MODEL_CONFIG
mkdir $OUTPUT_DIR


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
    --per_gpu_train_batch_size=$BATCH_SIZE