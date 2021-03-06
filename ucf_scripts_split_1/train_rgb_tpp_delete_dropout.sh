#!/usr/bin/env bash

DATASET=$1

filename=$(date '+%Y%m%d_%H:%M:%S')
echo $filename

TOOLS=lib/caffe-tpp-net/build/install/bin
LOG_FILE=logs/${DATASET}_${filename}.log

echo "logging to ${LOG_FILE}"

mpirun -np 2 \
$TOOLS/caffe train --solver=models/ucf101/rgb_tpp_delete_dropout_solver.prototxt  \
   --weights="init_models/bn_inception_rgb_init.caffemodel"