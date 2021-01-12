#!/bin/bash
set -euo pipefail

if [ -f "requirements.txt" ];
then
  pip install -r requirements.txt
fi

if [ -f "Pipfile" ];
then
  pipenv install --system --ignore-pipfile --deploy --dev
fi

if [ -f "poetry.lock" ];
then
  poetry config virtualenvs.create false && poetry install
fi

cd /workdir
eval "jupyter notebook"
