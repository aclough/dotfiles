#!/bin/bash

set -e

curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup component add rust-src rust-analysis rust-analyzer

cargo install tealdeer # for tldr pages
tldr --update

# Battery info
cargo install battop

cargo install cargo-update
