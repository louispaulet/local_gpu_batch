#!/usr/bin/env bash
set -euo pipefail

MODELS=${MODELS:-"sshleifer/tiny-gpt2"}
MODEL_DIR=${MODEL_DIR:-"models"}

mkdir -p "$MODEL_DIR"

for model in $MODELS; do
    echo "Pulling $model..."
    huggingface-cli download "$model" --local-dir "$MODEL_DIR/${model##*/}" --local-dir-use-symlinks False
done

