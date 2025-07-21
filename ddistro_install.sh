#!/bin/bash

cd /home/dwemer/piper
echo "Installing Piper-TTS."
echo "This will take a while so please wait."

python3 -m venv /home/dwemer/python-piper/

source /home/dwemer/python-piper/bin/activate



pip install flask
pip install onnxruntime
pip install onnxruntime-gpu[cuda,cudnn]

wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
apt-get update
apt-get -y install cuda-toolkit-12-9

pip install piper-tts[http]

./conf.sh


