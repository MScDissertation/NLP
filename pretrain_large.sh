#! bin/bash

# for base, uncased
export train_batch_size=32
export directory=/media/data/wikidump
in_file=${directory}/*/*.tfrecord
out_dir=${directory}/pretraining_output
rm -rf ${out_dir}
cfg_file=uncased_L-12_H-768_A-12/bert_config.json
num_train_steps=100000

sh nvidiasmi.sh pretrain &
python bert-master_v2/run_pretraining.py \
    --input_file=${in_file} \
    --output_dir=${out_dir} \
    --do_train=True \
    --do_eval=True \
    --bert_config_file=${cfg_file} \
    --train_batch_size=${train_batch_size} \
    --max_seq_length=128 \
    --max_predictions_per_seq=20 \
    --num_train_steps=${num_train_steps} \
    --num_warmup_steps=10000 \
    --learning_rate=2e-5

echo "Exiting"
pkill nvidia-smi
echo "New power consumption recorded"