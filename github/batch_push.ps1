#!/usr/bin/env pwsh

param (
	[string]$remote = "origin",
	[int]$batch_size = 50
)

$step_commits = git log --oneline --reverse | Select-Object -Index (0..($batch_size - 1))

foreach ($commit in $step_commits) {
	git push $remote $commit.Split(" ")[0]
}