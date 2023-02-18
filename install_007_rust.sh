#!/usr/bin/env bash
set -euo pipefail
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y
echo "source $HOME/.cargo/env" >>"$HOME/.bashrc"

cat "$HOME/.cargo/env"
chown vscode: -R "$HOME/.cargo"
"$HOME/.cargo/bin/rustup" default stable
"$HOME/.cargo/bin/cargo" install starship macchina verco --locked
