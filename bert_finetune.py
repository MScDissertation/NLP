#!/Users/shivangi/miniconda3/envs/myenv python
#tensorflow_version 2.x
import tensorflow as tf

import json
import math

from official.utils.misc import distribution_utils
from official.nlp import optimization
from official.nlp.bert import bert_models
from official.nlp.bert import configs as bert_configs
from official.nlp.bert import run_classifier
from official.modeling import activations
from official.nlp.modeling import networks
from official.nlp.modeling.models import bert_classifier

train_data_path = "fine_data/MRPC_train.tf_record"
eval_data_path = "fine_data/MRPC_eval.tf_record"
input_meta_path = "fine_data/MRPC_meta_data"

bert_config_file = "cased_L-12_H-768_A-12/bert_config.json"
ckpt_path = 'cased_L-12_H-768_A-12/bert_model.ckpt.index'

with tf.io.gfile.GFile(input_meta_path, 'rb') as reader:
  input_meta_data = json.loads(reader.read().decode('utf-8'))

max_seq_length = input_meta_data['max_seq_length']
num_classes = input_meta_data['num_labels']
batch_size = 32
eval_batch_size = 32
train_input_fn = run_classifier.get_dataset_fn(train_data_path, max_seq_length, batch_size, is_training=True)
eval_input_fn = run_classifier.get_dataset_fn(eval_data_path, max_seq_length, eval_batch_size, is_training=False)

strategy = distribution_utils.get_distribution_strategy(
      distribution_strategy='one_device', num_gpus=1)

with strategy.scope():
  training_dataset = train_input_fn()
  evaluation_dataset = eval_input_fn()
  bert_config = bert_configs.BertConfig.from_json_file(bert_config_file)
  classifier_model, encoder = bert_models.classifier_model(
      bert_config, num_classes, max_seq_length)

  checkpoint = tf.train.Checkpoint(model=encoder)
  #checkpoint.restore(ckpt_path).assert_consumed()

  epochs = 3
  train_data_size = input_meta_data['train_data_size']
  eval_data_size = input_meta_data['eval_data_size']
  steps_per_epoch = int(train_data_size / batch_size)
  warmup_steps = int(epochs * train_data_size * 0.1 / batch_size)
  optimizer = optimization.create_optimizer(
      2e-5, num_train_steps=steps_per_epoch * epochs, num_warmup_steps=warmup_steps)

  def metric_fn():
    return tf.keras.metrics.SparseCategoricalAccuracy(
        'test_accuracy', dtype=tf.float32)

  classifier_model.compile(optimizer=optimizer,
                           loss=run_classifier.get_loss_fn(num_classes=2),
                           metrics=[metric_fn()])
  classifier_model.fit(
        x=training_dataset,
        validation_data=evaluation_dataset,
        steps_per_epoch=steps_per_epoch,
        epochs=epochs,
        validation_steps=int(eval_data_size / eval_batch_size))

  classifier_model.save('/model/saved_model', include_optimizer=False, save_format='tf')