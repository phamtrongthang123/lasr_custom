#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
conda activate lasr/
pip install skeletor
pip install pyglet
pip install fastremap
pip install shapely