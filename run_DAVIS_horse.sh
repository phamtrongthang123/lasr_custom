#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
# conda env create -f lasr.yml --prefix lasr/
conda activate lasr/

# bash scripts/horse_kmeans.sh horsejump-high
# bash scripts/render_result.sh horsejump-high

bash scripts/horse_skeletor.sh horsejump-high
bash scripts/render_result_skeletor.sh horsejump-high