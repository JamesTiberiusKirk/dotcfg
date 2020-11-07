#!/bin/sh
pandoc $1 -V geometry:portrait -f markdown -o $1.pdf 
