#!/usr/bin/env bash

# Check that Docker is running
if ! command -v docker &>/dev/null; then
  echo "(!) Docker is not installed. Please install Docker to proceed."
  exit 1
fi

if ! docker ps &>/dev/null; then
  echo "(!) Docker is not running. Please start Docker to proceed."
  exit 1
fi

if ! command -v npx &>/dev/null; then
  echo "(!) node / npx is not installed."
  exit 1
fi

if command -v shfmt &>/dev/null; then
  echo "Running shfmt..."
  shfmt .
fi

if command -v pinact &>/dev/null; then
  echo "Running pinact..."
  pinact run -u
fi

# If "megalinter-reports" folder exists, delete it
if [ -d "megalinter-reports" ]; then
  if rm -rf "./megalinter-reports"; then
    echo "Deleted megalinter-reports..."
  else
    echo "Failed to delete megalinter-reports." >&2
    exit 1
  fi
fi

# Run mega-linter, it requires Docker
npx \
  --yes mega-linter-runner \
  --flavor cupcake \
  --fix \
  --remove-container \
  --container-name cupcake
