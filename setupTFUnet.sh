#!/bin/bash

cd $HOME/gitrepos
mkdir unet
# download source code
git clone https://github.com/NVIDIA/DeepLearningExamples.git
mv DeepLearningExamples/TensorFlow2/Segmentation/UNet_Medical/ unet/tf
cd $HOME/gitrepos/unet/tf

# download trained model weights
wget --content-disposition https://api.ngc.nvidia.com/v2/models/nvidia/dle/unetmedical_tf2_ckpt_amp/versions/21.11.0/zip -O unetmedical_tf2_ckpt_amp_21.11.0.zip
export tf_unet_zip=$(ls | grep *tf2_ckpt*.zip) && echo $tf_unet_zip

mkdir ckpt
unzip $tf_unet_zip -d ./ckpt
rm $tf_unet_zip

docker build -t tfunet:latest .