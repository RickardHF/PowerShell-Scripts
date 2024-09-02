#!/bin/bash

remote=${1:-origin}
batch_size=${2:-50}

step_commits=$(git log --oneline --reverse | awk "NR % $batch_size == 0")

echo "$step_commits" | while read commit message; do git push $remote $commit; done
