export TRAIN_FILE=../wikitext-2-raw/wiki.train.raw
export TEST_FILE=../wikitext-2-raw/wiki.test.raw
export OUTPUT_DIR=/media/data/bert-base-uncased
export BATCH_SIZE=1

if [ "$1" ]
then 
    export OUTPUT_DIR=$1
fi
mkdir $OUTPUT_DIR

if [ "$2" ]
then 
    export BATCH_SIZE=$2
fi
python ../transformers/examples/language-modeling/run_language_modeling.py \
    --output_dir=$OUTPUT_DIR \
    --overwrite_output_dir \
    --model_type=bert \
    --model_name_or_path=bert-base-uncased \
    --do_train \
    --train_data_file=$TRAIN_FILE \
    --do_eval \
    --eval_data_file=$TEST_FILE \
    --per_device_train_batch_size=$BATCH_SIZE \
    --mlm
