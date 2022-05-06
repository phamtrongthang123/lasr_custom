#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
# conda env create -f lasr.yml --prefix lasr/
conda activate lasr/

pip install gdown 
gdown https://drive.google.com/uc?id=11Y3WQ0Qd7W-6Wds1_A7KsTbaG7jrmG7N -O spot.zip
unzip spot.zip -d database/DAVIS/

# # Otherwise, you could render the same data locally by running,

# python scripts/render_syn.py