#!/bin/bash
# Generiert die Thumbnails für die Screenshots

find ../www/media/screenshots/ -name '*.png' -and -not -name '*thumb.png' | while read IMG_FILENAME; do
  echo -n "Generating/updating thumbnail for $IMG_FILENAME..."
  convert -geometry 200x "$IMG_FILENAME" "$(echo "$IMG_FILENAME" | sed 's/.png$/.thumb.png/')";
  echo " OK"
done