#!/usr/bin/env bash

set -e

base_dir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

cd "$base_dir/yg-render/parser"
go run . -o "$base_dir/output" -t "Haven for the Human Amoeba" -b "https://hha.acearchive.lgbt/" "$base_dir/archive"

export OUTPUT_DIR="$base_dir/output"
export PUBLIC_DIR="$base_dir/public"

cd "$base_dir/yg-render/pipeline"
npm install
npx gulp
