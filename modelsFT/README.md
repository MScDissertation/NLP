# fine tune training of models like roberta, gpt2, bert

Run individual model

<code>
sh roberta.sh 16
</code>

Run model and record power consumption

sh fine_tune.sh model_name batch_size layers

<code>
sh fine_tune.sh gpt2 16 12
</code>

Run all with different batch size

<code>sh run_all.sh /media/data 2</code>

arguments are output dir, batchsize and file to run if you want to run 1

<code>sh run_all.sh ../models 16 "bert-tiny"</code>

Run question answering

cd ..
sh download_squad.sh
cd ModelsFT
sh xlnet-base-cased.sh

### Notes

16 models

bert-base-uncased bert-large-uncased openai-gpt gpt2 gpt2-medium gpt2-large gpt2-xl xlnet-base-cased roberta-base roberta-large distilroberta-base distilbert-base-uncased bert-tiny bert-mini bert-small bert-medium

Dataset:
 1. wiki text 2 for language modelling 
 2. squad 2 for question answering
