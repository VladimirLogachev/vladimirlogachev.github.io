#!/bin/bash

# Remove old build
rm -rf "./build"

# Copy static files
cp -r "./src/static" "./build"

# Resize and optimize all raster images, which have width >200px
for filename in $(find ./build/images -name '*.jpg' -or -name '*.png' -or -name '*.gif' -or -name '*.jpeg' -or -name '*.webp')
do 
  convert "$filename" -resize '400x100000>' -quality 80 -define webp:lossless=false -define webp:method=6 -define webp:partitions=3 -define webp:auto-filter=true "$filename"
done

# Show stats
echo "Directory sizes in Kb:"
du -sk src/static/images
du -sk build/images

# Run elm dev server
elm-live "src/Main.elm" \
  --dir="./build" \
  --open \
  --port=8000 \
  --pushstate \
  --start-page "index.html" \
  -- \
  --output="./build/bundle.js"
