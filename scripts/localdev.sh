#!/bin/bash

# Remove old build
rm -rf "./build"

# Copy static files
cp -r "./src/static" "./build"

# Resize and compress raster images
# bash scripts/process_images.sh "./build/images/projects" "400" "80"
# bash scripts/process_images.sh "./build/images/library" "200" "80"

# Run elm dev server
elm-live "src/Main.elm" \
  --dir="./build" \
  --open \
  --port=8000 \
  --pushstate \
  --start-page "index.html" \
  -- \
  --output="./build/bundle.js"
