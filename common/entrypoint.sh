#!/bin/bash
set -euo pipefail

GLOB_BASE="/entrypoint/${CURRENT_ENVIRONMENT:-dev}"

for cmd in `echo "${GLOB_BASE}.*.sh"`; do
  echo "$cmd";
  if [ -f "$cmd" ]; then bash $cmd;fi
done

for cmd in `echo "${GLOB_BASE}.*.py"`; do
  echo "$cmd";
  if [ -f "$cmd" ]; then python3 $cmd;fi
done

exec "$@"
