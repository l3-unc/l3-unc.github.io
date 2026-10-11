#!/bin/bash
# Creates web-sized WebP copies of paper figures: images/pubpic/<name>.{png,jpg} -> images/pubpic/web/<name>.webp
# The site only publishes the web/ copies. Requires cwebp (brew install webp).
# Usage: scripts/optimize_pubpic.sh            (all images)
#        scripts/optimize_pubpic.sh foo.png    (one image)
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p images/pubpic/web
files=("$@")
if [ ${#files[@]} -eq 0 ]; then files=(images/pubpic/*.png images/pubpic/*.jpg images/pubpic/*.jpeg); fi
for f in "${files[@]}"; do
  [ -f "$f" ] || f="images/pubpic/$f"
  [ -f "$f" ] || continue
  name=$(basename "$f"); name="${name%.*}"
  w=$(magick identify -format %w "$f" 2>/dev/null || echo 9999)
  resize=""
  if [ "$w" -gt 800 ]; then resize="-resize 800 0"; fi
  cwebp -quiet -q 80 $resize "$f" -o "images/pubpic/web/$name.webp"
  echo "images/pubpic/web/$name.webp"
done
