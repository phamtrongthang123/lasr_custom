#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
# conda env create -f lasr.yml --prefix lasr/
conda activate lasr/

mkdir -p database/DAVIS/Annotations/Full-Resolution/
mkdir -p database/DAVIS/JPEGImages/Full-Resolution/

cp /home/ptthang/DAVIS/Annotations/Full-Resolution/camel/ -rf database/DAVIS/Annotations/Full-Resolution/
cp /home/ptthang/DAVIS/JPEGImages/Full-Resolution/camel/ -rf database/DAVIS/JPEGImages/Full-Resolution/

# mkdir -p ./lasr_vcn
# wget https://www.dropbox.com/s/bgsodsnnbxdoza3/vcn_rob.pth -O ./lasr_vcn/vcn_rob.pth

bash preprocess/auto_gen.sh camel
