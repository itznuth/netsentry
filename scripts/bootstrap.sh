#!/bin/sh
set -e

echo "Bootstrapping NetSentry..."

mkdir -p pcaps/benign
mkdir -p pcaps/malicious
mkdir -p results
mkdir -p artifacts/release/logs
mkdir -p artifacts/release/metrics
mkdir -p artifacts/release/charts
mkdir -p artifacts/release/notes

touch results/.gitkeep
touch artifacts/release/logs/.gitkeep
touch artifacts/release/metrics/.gitkeep
touch artifacts/release/charts/.gitkeep
touch artifacts/release/notes/.gitkeep

echo "Done."
