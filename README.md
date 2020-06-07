# BERT Finetuning

Requirements:

1. Python 3.6+
2. TensorFlow 2.0

### Virtual environment

1. download miniconda and set the paths
2. <code>
   conda update conda

   conda create -n venv python=3.7

   conda install -n venv jupyter scipy numpy matplotlib tensorflow-gpu tensorflow-hub
   </code>

3. <code> conda activate myenv</code>

4. <code> pip install tf-models-nightly </code>

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

1. git clone https://github.com/huggingface/transformers

    cd transformers

    pip install .

2. pip install -r ./examples/requirements.txt

(git pull \
pip install --upgrade .)


3. download data as in tensorflow example. No need to download model separately

4. cd ..
5. sh fine_tune_example.sh

6. Record gpu utilization details \
 sh nvidiasmi.sh

 
## Pretrain

version issues!

Got wiki data from https://github.com/pytorch/examples/tree/master/word_language_model/data for pretraining example