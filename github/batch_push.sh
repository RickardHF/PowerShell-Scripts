#!/bin/bash

branch=${1:-master}
remote=${2:-origin}
batch_size=${3:-50}

step_commits=$(git log --oneline --reverse refs/heads/$branch | awk "NR % $batch_size == 0")

echo "$step_commits" | while read commit message; do git push $remote $commit:refs/heads/$branch; done
