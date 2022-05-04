#!/usr/bin/env sh

set -e

base_dir="$(realpath "$(dirname "$0")")"

apk add --no-cache git git-lfs go npm

git lfs fetch
git lfs checkout
git submodule update --init

cd "$base_dir/yg-render/parser"
go run . -o "$base_dir/output" -t "Haven for the Human Amoeba" "$base_dir/archive"

export OUTPUT_DIR="$base_dir/output"
export PUBLIC_DIR="$base_dir/public"

cd "$base_dir/yg-render/pipeline"
npm install
npx gulp
