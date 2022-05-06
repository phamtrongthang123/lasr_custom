#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
# conda env create -f lasr.yml --prefix lasr/

conda env update --prefix lasr/ -f lasr.yml --prune
conda activate lasr/
# # install softras
# # to compile for different GPU arch, see https://discuss.pytorch.org/t/compiling-pytorch-on-devices-with-different-cuda-capability/106409
pip install -e third_party/softras/
# install manifold remeshing
git clone --recursive https://github.com/hjwdzh/Manifold.git; cd Manifold; mkdir build; cd build; cmake .. -DCMAKE_BUILD_TYPE=Release;make -j8; cd ../../
