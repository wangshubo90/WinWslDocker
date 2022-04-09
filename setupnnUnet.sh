#!/bin/bash

cd $HOME/gitrepos
git clone https://github.com/NVIDIA/DeepLearningExamples.git
mv DeepLearningExamples/PyTorch/Segmentation/nnUNet nnUnet
cd nnUnet

wget --content-disposition https://api.ngc.nvidia.com/v2/models/nvidia/dle/nnunet_pyt_ckpt_2d_fold2_amp/versions/21.11.0/zip -O nnunet_pyt_ckpt_2d_fold2_amp_21.11.0.zip
export nnzip=$(ls | grep nnunet*.zip)
unzip $nnzip
rm $nnzip
export nnzip=$(ls | grep nnunet*.ckpt)

docker build -t unet .
