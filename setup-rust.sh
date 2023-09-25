#!/bin/bash

set -e

curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup component add rust-src rust-analysis rust-analyzer

cargo install tealdeer # for tldr pages
tldr --update

# Battery info
cargo install battop

sudo apt install linux-tools-generic linux-tools-common
cargo install flamegraph
mkdir -p ~/.config/fish/completions
flamegraph --completions fish > ~/.config/fish/completions/flamegraph.fish

cargo install cargo-update
