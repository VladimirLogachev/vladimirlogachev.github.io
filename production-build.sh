#!/bin/bash

# Remove old build
rm -rf "./build"

# Copy static files
cp -r "./src/static" "./build"

# Resize and optimize all raster images, which have width >200px
for filename in $(find ./build/images -name '*.jpg' -or -name '*.png' -or -name '*.gif' -or -name '*.jpeg' -or -name '*.webp'); do
  convert "$filename" -resize '400x100000>' -quality 80 -define webp:lossless=false -define webp:method=6 -define webp:partitions=3 -define webp:auto-filter=true "$filename"
done

# Show stats
echo "Directory sizes in Kb:"
du -sk src/static/images
du -sk build/images

# Build Elm app
elm make --optimize --output="./bundle.js" src/Main.elm

# Minify .js bundle
npx uglify-js@3.7.6 "./bundle.js" --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | npx uglify-js@3.7.6 --mangle --output="./build/bundle.js"

# TODO: show Uglify.js stats
