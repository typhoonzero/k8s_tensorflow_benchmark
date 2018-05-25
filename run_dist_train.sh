#!/bin/bash

cp -r /usr/local/nvidia/lib64/* /usr/lib64 && \
unset http_proxy && unset https_proxy && \
cd /workspace/benchmarks/scripts/tf_cnn_benchmarks

python tf_cnn_benchmarks.py --num_gpus=8 --batch_size=64 \
--model=resnet50 \
--variable_update=distributed_replicated \
--gpu_memory_frac_for_testing 0.4 \
--job_name=ps \
--ps_hosts=${TF_PSERVER_EPS} \
--worker_hosts=${TF_WORKER_EPS} \
--task_index=${PADDLE_TRAINER_ID} &

python tf_cnn_benchmarks.py --num_gpus=8 --batch_size=64 \
--model=resnet50 \
--variable_update=distributed_replicated \
--gpu_memory_frac_for_testing 0.4 \
--job_name=worker \
--ps_hosts=${TF_PSERVER_EPS} \
--worker_hosts=${TF_WORKER_EPS} \
--task_index=${PADDLE_TRAINER_ID}
