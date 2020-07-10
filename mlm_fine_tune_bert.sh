export TRAIN_FILE=wikitext-2-raw/wiki.train.raw
export TEST_FILE=wikitext-2-raw/wiki.test.raw

python ./transformers/examples/language-modeling/run_language_modeling.py \
    --output_dir=output \
    --overwrite_output_dir \
    --model_type=roberta \
    --model_name_or_path=roberta-base \
    --do_train \
    --train_data_file=$TRAIN_FILE \
    --do_eval \
    --eval_data_file=$TEST_FILE \
    --per_device_train_batch_size=2 \
    --mlm
