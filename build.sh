#!/usr/bin/env bash

set -e

base_dir="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

cd "$base_dir/yahoo-groups-reader/parser"

go run . "$base_dir/archive" \
    --output "$base_dir/output" \
    --title "Haven for the Human Amoeba" \
    --base "https://hha.acearchive.lgbt/" \
    --link "archive,Ace Archive,https://acearchive.lgbt/artifact/haven-for-the-human-amoeba/" \
    --locale "en_US"

export OUTPUT_DIR="$base_dir/output"
export PUBLIC_DIR="$base_dir/public"

cd "$base_dir/yahoo-groups-reader/pipeline"
npm install
npx gulp
