# Environmental impact of running BERT

[![forthebadge](https://forthebadge.com/images/badges/powered-by-electricity.svg)](https://forthebadge.com)

# Analysis of data

## Notebooks

1. power_monitor_analysis/ExtractReading - get reading from power monitor for a time interval. The power monitor writes data in a database every 3 seconds.

1. Fine-tuningAnalysis - extracts data from nvidia-smi, power monitor and combine for analysis. Time-based models are compared to empirical values from power monitor. Carbon footprint is calculated. Also plotted the dataset size relationship with energy and time

1. RunInference - run inference on MRPC, CoLA and STS-B models fine-tuned earlier.

1. InferenceAnalysis - extracts data from nvidia-smi and power monitor for inference and combine for analysis. Time-based models are compared to empirical values from power monitor. Overall carbon footprint is calculated and combined with pre-training and fine-tuning.

1. CompareTimeModels - compare the time-based models.  
   Merges all data from pre-training, fine-tuning and inference to test scaling with time for models compared to analytical models

1. nvidia-smi data exploration - extract data from nvidia-smi for fine-tuning tasks and initial exploration.

1. Time series data stationary test - data exploration and test with ADF

# Data collection by training and inference

Requirements:

1. Python 3.6+
2. TensorFlow 2.2.0
3. Pytorch 1.5.0
4. Cuda 10.2

### Virtual environment

1. download miniconda and set the paths
2. `conda update conda`  
   `conda create -n venv python=3.7`  
   `conda install -n venv jupyter scipy numpy matplotlib tensorflow-gpu tensorflow-hub seaborn`

3. `conda activate venv`

<!-- 4. <code> pip install tf-models-nightly </code> -->

## Pre-train

Version issues :(

converted tf1 code to tf2 with tf_upgrade_v2.  
https://github.com/tensorflow/tensorflow/issues/26854

Steps:

1. Download model <code> sh download_uncased_base.sh </code>
1. Get wiki data from https://github.com/pytorch/examples/tree/master/word_language_model/data
1. Preprocess data <code>sh pretrain_data.sh</code>
1. Run training <code>sh pre_train.sh </code>  
   OR  
   train and record power data  
   <code> sh pretrain_and_record_power.sh </code>

## Pre-train with more data

https://github.com/google-research/bert/issues/341  
https://github.com/dsindex/bert

1. Download wiki dump
2. Extract using https://github.com/attardi/wikiextractor  
   <code>python ../wikiextractor/WikiExtractor.py /media/data/wikidownload.xml.bz2 --output /media/data/wikidump --processes 1 -q</code>

3. Clean using  
    <code>bash create_pretraining_data.sh</code>

   May need to install and import nltk  
   `pip install nltk`  
   `import nltk`  
   `nltk.download('punkt')`

4. Run pretraining <code>sh pretrain_large.sh</code>

## Data collection for fine-tune training

Runs fine-tune training and record power draw and utilisation with nvidia-smi

sh train_and_record_power.sh task batchsize maxSeqLength model(cased/uncased)

`sh train_and_record_power.sh CoLA 32 128 bert-base-cased`

### Example to fine-tune on MRPC:

1. Get model - download from https://github.com/google-research/bert

2. Get data using `download_glue_data.py`

   `python download_glue_data.py --data_dir data --tasks MRPC`

3. Prepare fine tune data using `sudo sh fine_tune.sh`  
   (edit fields)

4. Run `python bert_finetune.py`

<https://github.com/tensorflow/models/tree/master/official/nlp/bert>  
<https://github.com/tensorflow/models/tree/master/official/nlp/bert#process-datasets>

## huggingface transformer example

For pytorch implementation

1. `pip install statsmodels`

1. `git clone https://github.com/huggingface/transformers`

   `cd transformers`

   `pip install .`

1. `pip install -r ./examples/requirements.txt`

   (`git pull`  
   `pip install --upgrade .`)

1. download data as in tensorflow example. No need to download model separately

1. `cd ..`
1. `sh fine_tune_example.sh MRPC 32`

   Task argument can be CoLA, SST-2, MRPC, STS-B, QQP, MNLI, QNLI, RTE, WNLI \
   Second argument, batch size can 16, 32, 64, etc

1. Record gpu utilization details \
   `sh nvidiasmi.sh`

## Language modelling

Download wikitext2 from https://blog.einstein.ai/the-wikitext-long-term-dependency-language-modeling-dataset/

`sh mlm_fine_tune_bert.sh`

More in /modelsFT

<!--
### Test GPU

`import tensorflow as tf`
`print(tf.config.list_physical_devices('GPU'))` -->
