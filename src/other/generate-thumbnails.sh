#!/bin/bash

# Wird von Maven aufgerufen, um die Screenshot-Thumbnails zu erzeugen.
# workingDirectory = Projekt-Root-Verzeichnis

SCREENSHOTS_DIR=src/main/resources/public/media/screenshots

THUMBNAILS_DIR=$SCREENSHOTS_DIR/thumbnails
mkdir -p $THUMBNAILS_DIR

for FILENAME in $SCREENSHOTS_DIR/*; do
    if [ -f $FILENAME ]; then
        SCREENSHOT_FILENAME=$THUMBNAILS_DIR/$(basename "$FILENAME" .png).thumb.png
        echo "$SCREENSHOT_FILENAME:"

        if [ -f $SCREENSHOT_FILENAME ]; then
            echo "    >> Ignoring. Already exists."
        else
            echo -n "    >> Creating... "
            convert -geometry 200x $FILENAME $SCREENSHOT_FILENAME
            echo "Done."
        fi
    fi
done
