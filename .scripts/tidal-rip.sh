#!/bin/bash
# Takes in a file with a list of tidal links to download

echo $1

while IFS="" read -r l || [ -n "$l" ]
do
    echo "Downloading ${l}";
    tidal-dl -l "${l}"  -q Master;
done < $1
