#!/bin/bash
set -euo pipefail

FROM_FORMAT="pip"
FROM_FORMAT_PATH="requirements.txt"

FORMATS=(
  'Pipfile:pipfile',
  'Pipfile.lock:pipfilelock',
  'setup.py:setuppy',
  'environment.yml:conda',
  'flit:flit',
)

for fmt in ${FORMATS[@]};
do
  if [[ $fmt == *":"* ]]
  then
    fmt_parts=(${fmt//:/ })
    if [ -f "${fmt_parts[0]}" ]; then
      FROM_FORMAT=${fmt_parts[0]}
      FROM_FORMAT_PATH=${fmt_parts[1]}
    fi
  fi
done

dephell deps convert \
  --from-format=${FROM_FORMAT} \
  --from-path=${FROM_FORMAT_PATH} \
  --to=pyproject.toml
