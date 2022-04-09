#!/bin/bash

cd $HOME
mkdir gitrepos
cd gitrepos
git clone https://github.com/NVIDIA/clara-train-examples.git
mv clara-train-examples/PyTorch/NoteBooks clara
rm -rf clara-train-examples
