#!/bin/sh

inDir=$(realpath "${1}/")
outDir=$(realpath "${2}/")

function dir_step {
    find $1 -print0 | 
        while IFS= read -rd '' dir; do 
            
            echo "Converting $dir"
            #echo "$outDir/${dir/.flac}.mp3"  

            # if .flac then 
            ffmpeg -i "$dir" -acodec libmp3lame "$outDir/${dir/.flac}.mp3" #& 
            # else move file to new directory

        done
}

echo $1
#dir_step $1
echo ${inDir/$1}
