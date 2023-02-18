#!/usr/bin/env bash

# If you you gitbash, to use tflint, etc docker version, you need this.
(
	export MSYS_NO_PATHCONV=1
	"podman" "$@"
)
