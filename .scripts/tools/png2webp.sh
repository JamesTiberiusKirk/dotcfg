#!/bin/bash

# directory containing images
input_dir="$1"

# webp image quality
quality="$2"

outputdir="$3"

if [[ -z "$input_dir" ]]; then
	echo "Please specify an input directory."
	exit 1
elif [[ -z "$quality" ]]; then
	echo "Please specify image quality."
	exit 1
elif [[ -z "$outputdir" ]]; then
	outputdir="./webp"
	mkdir $outputdir
fi

# for each png in the input directory
for img in $(find $input_dir -type f -iname "*.*"); do
	mkdir -p $outputdir/$(dirname $img)
	cwebp $img -q $quality -o $outputdir/${img%.*}.webp
done
