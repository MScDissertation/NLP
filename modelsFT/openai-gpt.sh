export TRAIN_FILE=../wikitext-2-raw/wiki.train.raw
export TEST_FILE=../wikitext-2-raw/wiki.test.raw
export OUTPUT_DIR=/media/data/openai-gpt
export BATCH_SIZE=1
if [ "$1" ]
then 
    export BATCH_SIZE=$1
fi
python ../transformers/examples/language-modeling/run_language_modeling.py \
    --output_dir=$OUTPUT_DIR \
    --model_type=gpt \
    --model_name_or_path=openai-gpt \
    --do_train \
    --train_data_file=$TRAIN_FILE \
    --do_eval \
    --eval_data_file=$TEST_FILE \
    --per_device_train_batch_size=$BATCH_SIZE
