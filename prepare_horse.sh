#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
# conda env create -f lasr.yml --prefix lasr/
conda activate lasr/
cp /home/ptthang/DAVIS/Annotations/Full-Resolution/horsejump-high/ -rf database/DAVIS/Annotations/Full-Resolution/
cp /home/ptthang/DAVIS/JPEGImages/Full-Resolution/horsejump-high/ -rf database/DAVIS/JPEGImages/Full-Resolution/

# mkdir -p ./lasr_vcn
# gdown "https://drive.google.com/uc?id=139S6pplPvMTB-_giI6V2dxpOHGqqAdHn" -O ./lasr_vcn/vcn_rob.pth

bash preprocess/auto_gen.sh horsejump-high
