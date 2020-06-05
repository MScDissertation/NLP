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

### huggingface transformer example

For pytorch implementation

Python 3.6+ TensorFlow 2.0 PyTorch 1.0.0+

1. conda install -n venv tensorflow-datasets
2. conda install -n venv pytorch torchvision -c pytorch
3. pip install transformers

### Steps:

1. Get model - download from https://github.com/google-research/bert

2. Get data using download_glue_data.py

   <code>python download_glue_data.py --data_dir data --tasks MRPC</code>

3. Prepare fine tune data using <code>sudo sh fine_tune.sh</code>
   (edit fields)

   https://github.com/tensorflow/models/tree/master/official/nlp/bert

   https://github.com/tensorflow/models/tree/master/official/nlp/bert#process-datasets

4. Run bert_finetune.py


Got wiki data from https://github.com/pytorch/examples/tree/master/word_language_model/data