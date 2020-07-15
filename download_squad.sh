#! bin/bash
export DIR=SQUAD
mkdir $DIR
curl https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v2.0.json --output $DIR/train-v2.0.json
curl https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v2.0.json --output $DIR/dev-v2.0.json
curl https://worksheets.codalab.org/rest/bundles/0x6b567e1cf2e041ec80d7098f031c5c9e/contents/blob/ --output $DIR/evaluate-v2.0.json