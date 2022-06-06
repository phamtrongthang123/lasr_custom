# Copyright 2021 Google LLC
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     https://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
# conda env create -f lasr.yml --prefix lasr/
conda activate lasr/
dev=2
modelname=$1
epoch=$2
fr=$3
nmesh=$4
logdir=log
dataname=$5
evolve=$6
symm=$7

CUDA_VISIBLE_DEVICES=$dev python extract.py --checkpoint_dir $logdir/ --name $modelname \
--num_train_epoch $epoch \
--notexture --only_mean_sym --n_bones $nmesh --dataname $dataname \
--evolve $evolve --${symm}symmetric

ffmpeg -r $fr -i $logdir/$modelname/render-%*.png -c:v libx264 -vf fps=$fr -pix_fmt  yuv420p $logdir/$modelname/$dataname-$modelname-$epoch.mp4

ffmpeg \
  -i $logdir/$modelname/$dataname-$modelname-$epoch.mp4 \
  $logdir/$modelname/$dataname-$modelname-$epoch.gif
