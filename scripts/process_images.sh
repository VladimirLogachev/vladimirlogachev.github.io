#!/bin/bash

# Resize and compress raster images

DIR=$1
MAX_WIDTH=$2
QUALITY=$3

echo "Compressing and resizing images in: \"$DIR\""
echo "MAX_WIDTH: $MAX_WIDTH"
echo "QUALITY: $QUALITY"
echo "Size before: $(du -sk "$DIR" | cut -f1) kB"

# Perform actions
for filename in $(find "${DIR}" -name '*.jpg' -or -name '*.png' -or -name '*.gif' -or -name '*.jpeg' -or -name '*.webp'); do
  convert "$filename" -resize "${MAX_WIDTH}x100000>" -quality "$QUALITY" -define webp:lossless=false -define webp:method=6 -define webp:partitions=3 -define webp:auto-filter=true "$filename"
done

# Show stats
echo "Size after: $(du -sk "$DIR" | cut -f1) kB"
