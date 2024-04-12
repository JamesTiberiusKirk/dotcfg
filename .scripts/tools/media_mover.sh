#!/bin/bash
# For the server

DL_FOLDER=/mnt/18tb/downloads/complete
MEDIA=/mnt/18tb/Media

ANIME=/Anime
ANIME_SHOWS=/Anime_Shows
CARTOONS=/Cartoons
MOVIES=/Movies
MUSIC=/Music
TV=/tv_shows

cd "$DL_FOLDER"
ESCAPED_FILES=$(ls --quoting-style=escape .)
SELECTED_FILES=$(gum choose --height=50 --no-limit <<<"$ESCAPED_FILES")
TYPE=$(gum choose "$ANIME" "$ANIME_SHOWS" "$CARTOONS" "$MOVIES" "$MUSIC" "$TV")
DEST_DIR="$MEDIA$TYPE/"

# Loop through each selected file/folder and move it to the chosen directory
IFS=$'\n'
for ESCAPED_FILE in $SELECTED_FILES; do
    FILE="${ESCAPED_FILE//\\/}"  # Remove extra backslashes
    FILE="$DL_FOLDER/$FILE"
    if [ -d "$FILE" ]; then
        echo "Moving directory $FILE to $DEST_DIR"
        mv "$FILE" "$DEST_DIR"
    else
        echo "Moving file $FILE to $DEST_DIR"
        mv "$FILE" "$DEST_DIR"
    fi
done
