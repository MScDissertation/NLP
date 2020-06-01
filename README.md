## BERT Finetuning

Requirements:

1. Python 3.6+
2. TensorFlow 2.0

Get model - download from https://github.com/google-research/bert

Get data using download_glue_data.py

Prepare fine tune data using

<code>
export GLUE_DIR=~/data
export BERT_DIR=bert/cased_L-12_H-768_A-12

export TASK_NAME=MRPC
export OUTPUT_DIR=fine_data
python ../data/create_finetuning_data.py \
 --input_data_dir=${GLUE_DIR}/${TASK_NAME}/ \
 --vocab_file=${BERT_DIR}/vocab.txt \
 --train_data_output_path=${OUTPUT_DIR}/${TASK_NAME}_train.tf_record \
 --eval_data_output_path=${OUTPUT_DIR}/${TASK_NAME}_eval.tf_record \
 --meta_data_file_path=${OUTPUT_DIR}/${TASK_NAME}_meta_data \
 --fine_tuning_task_type=classification --max_seq_length=128 \
 --classification_task_name=${TASK_NAME}
</code>

Run bert_finetune.py

### huggingface transformer example

Python 3.6+

1. TensorFlow 2.0
2. PyTorch 1.0.0+
3. pip install transformers
