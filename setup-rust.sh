#!/bin/bash

set -e

curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup component add rust-src rls rust-analysis

cargo install racer # For nvim completion

cargo install tealdeer # for tldr pages
tldr --update

sudo apt install linux-tools-generic linux-tools-common
cargo install flamegraph 
mkdir -p ~/.config/fish/completions
flamegraph --completions fish > ~/.config/fish/completions/flamegraph.fish
