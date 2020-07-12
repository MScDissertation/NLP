export TRAIN_FILE=../wikitext-2-raw/wiki.train.raw
export TEST_FILE=../wikitext-2-raw/wiki.test.raw

python ../transformers/examples/language-modeling/run_language_modeling.py \
    --output_dir=GPT/weights \
    --model_type=gpt2 \
    --model_name_or_path=gpt2 \
    --do_train \
    --train_data_file=$TRAIN_FILE \
    --do_eval \
    --eval_data_file=$TEST_FILE \
    --per_device_train_batch_size=1
