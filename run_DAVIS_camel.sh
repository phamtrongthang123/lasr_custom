#!/bin/bash
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
# conda env create -f lasr.yml --prefix lasr/
conda activate lasr/

# bash scripts/template.sh camel
# bash scripts/render_result_skeletor.sh camel

bash scripts/template_old.sh camel
bash scripts/render_result.sh camel