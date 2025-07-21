#!/bin/bash

cd /home/dwemer/piper/

source /home/dwemer/python-piper/bin/activate

python -m piper.http_server --data-dir "/home/dwemer/piper/voices" --download-dir "/home/dwemer/piper/voices" -m "/home/dwemer/piper/voices/en_US-amy-low.onnx" &> log.txt &


