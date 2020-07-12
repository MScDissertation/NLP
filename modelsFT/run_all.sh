#! bin/bash
export BATCH_SIZE=1
if [ "$1" ]
then
  export BATCH_SIZE=$1
fi
export LIST="bert-base-uncased bert-large-uncased openai-gpt gpt2 gpt2-medium gpt2-large gpt2-xl xlnet-base-cased roberta-base roberta-large distilroberta-base distilbert-base-uncased"

for model in ${LIST}; do
    sh fine_tune.sh ${model} $BATCH_SIZE    
done