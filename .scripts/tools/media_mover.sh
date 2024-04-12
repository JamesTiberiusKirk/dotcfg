#!/bin/sh

DL_FOLDER=$1
MEDIA=$2

# ANIME=/Anime
# ANIME_SHOWS=/Anime_Shows
# CARTOONS=/Cartoons
# MOVIES=/Movies
# MUSIC=/Music
# TV=/tv_shows

cd $DL_FOLDER
FILES=$(ls -Q . | gum choose --height=50 --no-limit)
SORTE=$(echo "$FILES" | sed "s/ *\(.*\) *$/'\1'/")
echo "$SORTE"
# TYPE=$(gum choose $ANIME $ANIME_SHOWS $CARTOONS $MOVIES $MUSIC $TV)

echo "$MEDIA/" $FILES
# mv $FILES "$MEDIA/"

FILES=""
for file in *; do
    FILES="$FILES '${file//\'/\'}'"
done
FILES=$(echo "$FILES" | gum choose --height=50 --no-limit)
