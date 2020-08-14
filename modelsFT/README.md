# fine tune training of models like roberta, gpt2, bert

Run individual model

<code>
sh roberta.sh 16
</code>

Run model and record power consumption

`sh fine_tune.sh model_name batch_size layers`

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

Dataset:

1.  wiki text 2 for language modelling
2.  squad 2 for question answering

16 models

1. bert-base-uncased
1. bert-large-uncased
1. openai-gpt
1. gpt2
1. gpt2-medium
1. gpt2-large
1. gpt2-xl
1. xlnet-base-cased
1. roberta-base
1. roberta-large
1. distilroberta-base
1. distilbert-base-uncased
1. bert-tiny
1. bert-mini
1. bert-small
1. bert-medium
