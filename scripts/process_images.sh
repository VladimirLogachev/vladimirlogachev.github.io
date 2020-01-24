#!/bin/bash

# Resizes and compresses raster images

DIR=$1
MAX_WIDTH=$2
QUALITY=$3

echo "Compressing and resizing images in: \"$DIR\""
echo "MAX_WIDTH: $MAX_WIDTH"
echo "QUALITY: $QUALITY"

# calculate random string for renaming source file
uuid=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

echo "Compression results in kB:"
# Perform actions
for filename in $(find "${DIR}" -name '*.jpg' -or -name '*.png' -or -name '*.gif' -or -name '*.jpeg' -or -name '*.webp'); do

  # calculate names
  extension="${filename##*.}"
  base="$(basename -- "$filename" ".$extension")"
  dir="$(dirname $filename)"
  filename_x1="$dir/$base.$extension"
  filename_x1_5="$dir/${base}_x1_5.$extension"
  filename_x2="$dir/${base}_x2.$extension"
  src_temp_name="$dir/$base.$uuid.$extension"

  # rename src file and memorize initial size
  mv $filename $src_temp_name
  size_before=$(du -sk "$src_temp_name" | cut -f1)

  # compress and memorize sizes (note: imagemagick rounds floating numbers up)
  convert "$src_temp_name" -resize "$(bc <<<$MAX_WIDTH*2)x100000>" -quality "$QUALITY" -define webp:lossless=false -define webp:method=6 -define webp:partitions=3 -define webp:auto-filter=true "$filename_x2"
  size_x2=$(du -sk "$filename_x2" | cut -f1)
  convert "$src_temp_name" -resize "$(bc <<<$MAX_WIDTH*1.5)x100000>" -quality "$QUALITY" -define webp:lossless=false -define webp:method=6 -define webp:partitions=3 -define webp:auto-filter=true "$filename_x1_5"
  size_x1_5=$(du -sk "$filename_x1_5" | cut -f1)
  convert "$src_temp_name" -resize "${MAX_WIDTH}x100000>" -quality "$QUALITY" -define webp:lossless=false -define webp:method=6 -define webp:partitions=3 -define webp:auto-filter=true "$filename_x1"
  size_x1=$(du -sk "$filename_x1" | cut -f1)

  # remove source
  rm $src_temp_name

  # show results
  echo "$filename: $size_before -> $size_x1, $size_x1_5, $size_x2"
done
