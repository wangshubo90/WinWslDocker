#!/bin/bash

cd $HOME/gitrepos
mkdir unet
git clone https://github.com/NVIDIA/DeepLearningExamples.git
mv DeepLearningExamples/PyTorch/Segmentation/nnUNet unet/nn
cd $HOME/gitrepos/unet/nn

wget --content-disposition https://api.ngc.nvidia.com/v2/models/nvidia/dle/nnunet_pyt_ckpt_2d_fold2_amp/versions/21.11.0/zip -O nnunet_pyt_ckpt_2d_fold2_amp_21.11.0.zip
export nnzip=$(ls | grep nnunet*.zip) && echo $nnzip
mkdir ckpt
unzip $nnzip -d ckpt
rm $nnzip

docker build -t nnunet:latest .
