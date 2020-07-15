export TRAIN_FILE=../wikitext-2-raw/wiki.train.raw
export TEST_FILE=../wikitext-2-raw/wiki.test.raw
export OUTPUT_DIR=/media/data/gpt2-medium
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
    --model_type=gpt2 \
    --model_name_or_path=gpt2-medium \
    --do_train \
    --train_data_file=$TRAIN_FILE \
    --do_eval \
    --eval_data_file=$TEST_FILE \
    --per_device_train_batch_size=$BATCH_SIZE
