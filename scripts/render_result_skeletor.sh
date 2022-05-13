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
#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
# conda env create -f lasr.yml --prefix lasr/
conda activate lasr/
seqname=$1

# predict articulated meshes
# bash scripts/extract.sh $seqname-6 <epoch-th> <fps> <bones> $seqname no no

bash scripts/extract.sh $seqname-6 10 3 45 $seqname no no
sleep 1

# visualize reconstruction
python render_vis.py --testdir log/$seqname-6/ --seqname $seqname --outpath tmp/2.gif 
sleep 1

# turntable vis
python render_vis.py --testdir log/$seqname-6/ --seqname $seqname --outpath tmp/3.gif --freeze
sleep 1

# visualize bones
python render_vis.py --testdir log/$seqname-6/ --seqname $seqname --outpath tmp/4.gif --vis_bones  --gray