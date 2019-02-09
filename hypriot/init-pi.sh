#!/bin/bash

# Get Conda
wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-armv7l.sh
md5sum Miniconda3-latest-Linux-armv7l.sh
bash Miniconda3-latest-Linux-armv7l.sh

# Must fit to the installation options chosen previously
source ~/.bashrc

# Create Conda env
conda create --name openrcpp -y anaconda-client

echo "Done."