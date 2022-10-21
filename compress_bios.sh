#!/bin/bash
# NOTE: Perhaps one day we can do this with GitHub Actions,
# https://github.com/marketplace/actions/image-actions looks promising but doesn't
# support resizeing yet and overwrites the existing image.

rm -rf "images/bios_compressed"
mkdir -p "images/bios_compressed"

for filename in "images/teampic"/*.{jpg,png,jpeg}
do
    basename=$(basename ${filename%.*})
    echo "$basename"
    convert -define jpeg:size=200x200 $filename -thumbnail '200x200>' -quality 85 \
        -background white -gravity center -extent 200x200 "images/bios_compressed/$basename.jpg"
done