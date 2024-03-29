#!/bin/bash
# NOTE: Perhaps one day we can do this with GitHub Actions,
# https://github.com/marketplace/actions/image-actions looks promising but doesn't
# support resizeing yet and overwrites the existing image.

rm -rf "images/slider_compressed"
mkdir -p "images/slider_compressed"

for filename in "images/slider"/*.{jpg,png,jpeg}
do
    basename=$(basename ${filename%.*})
    echo "$basename"
    convert -define jpeg:size=1920x1080 $filename -thumbnail '1920x1080>' -quality 100 \
        -background white -gravity center -extent 1920x1080 "images/slider_compressed/$basename.jpg"
done