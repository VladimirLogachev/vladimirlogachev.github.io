#!/bin/bash

# Remove old build
rm -rf "./build"

# Copy static files
cp -r "./static" "./build"

# Resize and compress raster images
# bash assets.config.sh

# Run elm dev server
elm-live "src/Main.elm" \
  --dir="./build" \
  --open \
  --port=8000 \
  --pushstate \
  --start-page "index.html" \
  -- \
  --output="./build/bundle.js"
