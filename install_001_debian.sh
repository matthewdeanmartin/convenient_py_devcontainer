#!/usr/bin/env bash
set -euo pipefail
# Microsoft base image does not upgrade by default!
apt-get update -q -y
apt-get upgrade -y -q
apt-get install -y \
	--no-install-recommends \
	build-essential \
	python-dev \
	libpq-dev \
	libffi-dev \
	git gnupg gnupg2 \
	zip unzip curl \
	libpango-1.0-0 libpangoft2-1.0-0 libcairo2 libpq-dev libpangocairo-1.0-0 \
	python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info \
	pandoc \
	postgresql-client lynx cmake stow \
	emacs neovim python3-neovim \
	mc \
	zip unzip \
	elvish \
	apt-transport-https \
	software-properties-common

# Powershell
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
apt update && sudo apt install -y -q --no-install-recommends powershell

# Git Secrets
apt-get clean
rm -rf /var/lib/apt/lists/*
bash -c "cd ~ && git clone https://github.com/awslabs/git-secrets.git && cd git-secrets && make install"
python -m pip install --no-cache-dir --user pipx
python -m pipx ensurepath
export PATH=$PATH:/root/.local/bin
