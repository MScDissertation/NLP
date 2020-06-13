# BERT Finetuning

Requirements:

1. Python 3.6+
2. TensorFlow 2.0

### Virtual environment

1. download miniconda and set the paths
2. <code>
   conda update conda

   conda create -n venv python=3.7

   conda install -n venv jupyter scipy numpy matplotlib tensorflow-gpu tensorflow-hub seaborn 
   </code>

3. <code> conda activate myenv</code>
<!-- 
4. <code> pip install tf-models-nightly </code>  -->

### Steps:

1. Get model - download from https://github.com/google-research/bert

2. Get data using download_glue_data.py

   <code>python download_glue_data.py --data_dir data --tasks MRPC</code>

3. Prepare fine tune data using <code>sudo sh fine_tune.sh</code>
   (edit fields)

   https://github.com/tensorflow/models/tree/master/official/nlp/bert

   https://github.com/tensorflow/models/tree/master/official/nlp/bert#process-datasets

4. Run bert_finetune.py


### huggingface transformer example

For pytorch implementation

Python 3.6+ TensorFlow 2.0 PyTorch 1.0.0+

pip install statsmodels

1. git clone https://github.com/huggingface/transformers

    cd transformers

    pip install .

2. pip install -r ./examples/requirements.txt

(git pull \
pip install --upgrade .)


3. download data as in tensorflow example. No need to download model separately

4. cd ..
5. sh fine_tune_example.sh MRPC 32

Task argument can be CoLA, SST-2, MRPC, STS-B, QQP, MNLI, QNLI, RTE, WNLI \
Second argument, batch size can 16, 32, 64, etc

6. Record gpu utilization details \
 sh nvidiasmi.sh

## Data collection
Runs fine-tune training and record nvidia-smi output \
Using pytorch 

sh train_and_record_power.sh task batchsize maxSeqLength model(cased/uncased)

<code>sh train_and_record_power.sh CoLA 32 128 bert-base-cased</code>
 
### Language modelling

Download wikitext2 from https://blog.einstein.ai/the-wikitext-long-term-dependency-language-modeling-dataset/

sh mlm_fine_tune_bert.sh


## Pretrain
tensorflow 2.x

Version issues :(

converted tf1 code to tf2 with tf_upgrade_v2. \
https://github.com/tensorflow/tensorflow/issues/26854

Steps:
0. Download model <code> sh download_uncased_base.sh </code>
1. Got wiki data from https://github.com/pytorch/examples/tree/master/word_language_model/data 
2. Preprocess data <code>sh pretrain_data.sh</code>
3. Run training <code>sh pre_train.sh </code>
