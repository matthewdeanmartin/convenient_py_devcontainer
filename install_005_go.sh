#!/usr/bin/env bash
# The ENV needs to match the same in the Dockerfile! Ugly, yes.
export GO_VERSION=1.19.5
curl -fsSL "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" | tar -xzC /usr/local
export PATH="/go/bin:/usr/local/go/bin:$PATH"
export GOPATH="/go"
# TODO: install useful go apps.
# https://github.com/xxxserxxx/gotop
go install github.com/xxxserxxx/gotop/v4/cmd/gotop@latest
