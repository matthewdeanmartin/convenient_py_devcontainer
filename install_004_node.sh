#!/usr/bin/env bash
set -euo pipefail
curl https://nodejs.org/dist/v18.13.0/node-v18.13.0-linux-x64.tar.xz -O
# doesn't the above wait until finish?
sleep 10
tar -xf node-v18.13.0-linux-x64.tar.xz
ln -s /node-v18.13.0-linux-x64/bin/node /usr/local/bin/node
ln -s /node-v18.13.0-linux-x64/bin/npm /usr/local/bin/npm
ln -s /node-v18.13.0-linux-x64/bin/npx /usr/local/bin/npx
node --version
npm install --global prettier pyright
