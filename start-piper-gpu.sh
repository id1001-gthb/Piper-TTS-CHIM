#!/bin/bash

cd /home/dwemer/piper/

source /home/dwemer/python-piper/bin/activate

export LD_LIBRARY_PATH=/home/dwemer/python-piper/lib/python3.11/site-packages/nvidia/cuda_runtime/lib:/home/dwemer/python-piper/lib/python3.11/site-packages/nvidia/cuda_nvrtc/lib:/home/dwemer/python-piper/lib/python3.11/site-packages/nvidia/cudnn/lib:$LD_LIBRARY_PATH

python -m piper.http_server --data-dir "/home/dwemer/piper/voices" --download-dir "/home/dwemer/piper/voices" -m "/home/dwemer/piper/voices/en_US-amy-low.onnx" --cuda &> log.txt &


