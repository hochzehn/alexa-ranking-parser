#!/usr/bin/env bash

DOWNLOAD_URL=http://s3.amazonaws.com/alexa-static/top-1m.csv.zip

TARGET_DIR=tmp
TARGET_FILE="$TARGET_DIR"/alexa.csv
TEMP_ZIP_FILE="$TARGET_DIR"/alexa.csv.zip
TEMP_CSV_FILE="$TARGET_DIR"/top-1m.csv

wget -O "$TEMP_ZIP_FILE" "$DOWNLOAD_URL"

unzip "$TEMP_ZIP_FILE" -d "$TARGET_DIR"
mv "$TEMP_CSV_FILE" "$TARGET_FILE"
rm "$TEMP_ZIP_FILE"
