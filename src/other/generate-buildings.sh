#!/bin/bash

# Wird von Maven aufgerufen, um die Gebäude zu rendern
# workingDirectory = Projekt-Root-Verzeichnis
#
# Dieses Script erwartet, dass unter workingDirectory/../OpenIsles liegt und dessen Makefile
# bereits mit "make render-blender" ausgeführt wurde.

OPENISLES_DIR=../OpenIsles

MAKEFILE=$OPENISLES_DIR/Makefile
if [ ! -f $MAKEFILE ]; then
    echo "Error: Makefile not found. Maybe the path to OpenIsles is wrong."
    exit 1
fi

# Makefile einlesen und die Gebäudenamen herausparsen. Danach die Dateien ins resources-Verzeichnis kopieren
while read LINE; do
    REGEXP="BUILDINGS := (.+)"
    if [[ $LINE =~ $REGEXP ]]; then
        BUILDINGS=${BASH_REMATCH[1]}

        for BUILDING in $BUILDINGS; do
            echo "Copy images for building $BUILDING:"

            SRC_DIR=$OPENISLES_DIR/src/blender/buildings/$BUILDING
            DEST_DIR=src/main/resources/public/img/buildings/$BUILDING

            mkdir -p $DEST_DIR

            ANGLES="angle0 angle90 angle180 angle270"
            for FILENAME in $ANGLES; do
                SRC_FILE=$SRC_DIR/render/$FILENAME.png
                cp -v $SRC_FILE $DEST_DIR
                if [ $? -eq 1 ]; then
                    echo "Error copying $SRC_FILE. Aborting."
                    exit 1
                fi
            done
        done
        break
    fi
done <$MAKEFILE
