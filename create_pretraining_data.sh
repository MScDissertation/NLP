#! /bin/bash

# for uncased
do_lower_case='True'

export vocab=uncased_L-12_H-768_A-12/vocab.txt
export datadir=/media/data/wikidump
export dirlist=`ls ${datadir}`

function fclear {
    for dir in ${dirlist}; do
        files=`ls ${datadir}/${dir} | grep -v '.pre'`
        for file in ${files}; do
            file=${datadir}/${dir}/${file}
            in_file=${file}.pre
            echo ${in_file}
            rm -rf ${in_file}
            out_file=${in_file}.tfrecord
            echo ${out_file}
            rm -f ${out_file}
        done
    done
}

#fclear

function create_data {
    for dir in ${dirlist}; do
        echo ${datadir}/${dir}
        files=`ls ${datadir}/${dir} | grep -v '.pre'`
        for file in ${files}; do
            file=${datadir}/${dir}/${file}
            in_file=${file}.pre
            python preprocess.py < ${file} > ${in_file}
            echo ${in_file}
            out_file=${in_file}.tfrecord
            rm -f ${out_file}
            python create_pretraining_data.py \
                --input_file=${in_file} \
                --output_file=${out_file} \
                --vocab_file=${vocab} \
                --do_lower_case=${do_lower_case} \
                --max_seq_length=128 \
                --max_predictions_per_seq=20 \
                --masked_lm_prob=0.15 \
                --random_seed=12345 \
                --dupe_factor=5
        done
    done
}

create_data
