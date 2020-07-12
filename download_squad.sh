#! bin/bash
export DIR=SQUAD
mkdir $DIR
curl https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v1.1.json --output $DIR/train-v1.1.json
curl https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v1.1.json --output $DIR/dev-v1.1.json
curl https://github.com/allenai/bi-att-flow/blob/master/squad/evaluate-v1.1.py --output $DIR/dev-v1.1.json