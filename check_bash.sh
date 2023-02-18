#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo "homogenizing line endings"
for file_name in *.sh; do
	dos2unix "$file_name"
done

echo "shell checking"
for file_name in *.sh; do
	shellcheck "$file_name"
done

echo "reformatting"
for file_name in *.sh; do
	./podman.sh run --rm --volume "$PWD":/code docker.io/mvdan/shfmt:latest -w /code/"$file_name"
done

echo "various pre-commit checks"
pre-commit run --all-files
