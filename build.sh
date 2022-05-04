#!/usr/bin/env

set -e

base_dir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

apt-get update
apt-get install golang npm

cd "$base_dir/yg-render/parser"
go run . -o "$base_dir/output" -t "Haven for the Human Amoeba" "$base_dir/archive"

export OUTPUT_DIR="$base_dir/output"
export PUBLIC_DIR="$base_dir/public"

cd "$base_dir/yg-render/pipeline"
npm install
npx gulp
