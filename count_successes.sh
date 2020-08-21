#!/usr/bin/env bash

tar_file=$1

SCRATCH=$(mktemp -d)

tar -zxf "$tar_file" --directory="$SCRATCH"

num_successes=$(grep -r -l "SUCCESS" "$SCRATCH" | wc -l)
num_failures=$(grep -r -l "FAILURE" "$SCRATCH" | wc -l)

echo "There were $num_successes successes and $num_failures failures."

rm -rf "$SCRATCH"
