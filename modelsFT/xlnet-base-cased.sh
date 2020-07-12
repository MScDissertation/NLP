export OUTPUT_DIR=/media/data/xlnet-base-cased
mkdir $OUTPUT_DIR
export BATCH_SIZE=1
if [ "$1" ]
then 
    export BATCH_SIZE=$1
fi
export SQUAD_DIR=/path/to/SQUAD

python ../transformers/examples/question-answering/run_squad.py \
    --model_type xlnet \
    --model_name_or_path xlnet-large-cased \
    --do_train \
    --do_eval \
    --train_file $SQUAD_DIR/train-v1.1.json \
    --predict_file $SQUAD_DIR/dev-v1.1.json \
    --learning_rate 3e-5 \
    --num_train_epochs 1 \
    --output_dir $OUTPUT_DIR \
    --per_device_eval_batch_size=$BATCH_SIZE \
    --per_device_train_batch_size=$BATCH_SIZE  \
    --save_steps 10000