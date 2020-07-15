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

arguments are output dir, batchsize and files to run

<code>sh run_all.sh /media/data 2 [bert-tiny bert-medium]</code>

Run question answering

cd ..
sh download_squad.sh
cd ModelsFT
sh xlnet-base-cased.sh
