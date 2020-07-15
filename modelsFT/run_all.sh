#! bin/bash
export OUTPUT_DIR=/media/data
export BATCH_SIZE=1

if [ "$1" ]
then 
    export OUTPUT_DIR=$1
fi
mkdir $OUTPUT_DIR

if [ "$2" ]
then 
    export BATCH_SIZE=$2
fi
export LIST="bert-base-uncased bert-large-uncased openai-gpt gpt2 gpt2-medium gpt2-large gpt2-xl xlnet-base-cased roberta-base roberta-large distilroberta-base distilbert-base-uncased bert-tiny bert-mini bert-small bert-medium"

if [ "$3" ]
then
  export LIST=$3
fi

for model in ${LIST}; do
    sh fine_tune.sh ${model} $BATCH_SIZE $OUTPUT_DIR/${model}
done