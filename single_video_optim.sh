#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
# conda env create -f lasr.yml --prefix lasr/
conda activate lasr/
pip install trimesh
bash scripts/spot3.sh
# To render the optimized shape, texture and camera parameters

bash scripts/extract.sh spot3-1 10 1 26 spot3 no no
mkdir log 
mkdir log/spot3-1/
python render_vis.py --testdir log/spot3-1/ --seqname spot3 --freeze --outpath tmp/1.gif                                                                                                                                                                                                                                                         