#/usr/bin/env bash

git clone https://github.com/microsoft/Bringing-Old-Photos-Back-to-Life.git photo_restoration

wget || echo "Make sure to have wget installed with openssl v1.0.2"
bzip2 || echo "Make sure to have bzip2 installed"

# pull the syncBN repo
cd photo_restoration/Face_Enhancement/models/networks
git clone https://github.com/vacancy/Synchronized-BatchNorm-PyTorch
cp -rf Synchronized-BatchNorm-PyTorch/sync_batchnorm .
cd ../../../

cd Global/detection_models
git clone https://github.com/vacancy/Synchronized-BatchNorm-PyTorch
git clone https://github.com/vacancy/Synchronized-BatchNorm-PyTorch
cp -rf Synchronized-BatchNorm-PyTorch/sync_batchnorm .
cd ../../

# download the landmark detection model
cd Face_Detection/
wget http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2
bzip2 -d shape_predictor_68_face_landmarks.dat.bz2
cd ../

# download the pretrained model
cd Face_Enhancement/
wget https://facevc.blob.core.windows.net/zhanbo/old_photo/pretrain/Face_Enhancement/checkpoints.zip
unzip checkpoints.zip
cd ../

cd Global/
wget https://facevc.blob.core.windows.net/zhanbo/old_photo/pretrain/Global/checkpoints.zip
unzip checkpoints.zip
cd ../

# Create and activate venv
cd ../
virtualenv --always-copy env
source env/bin/activate

# Start jupyter notebook
jupyter notebook