#!/bin/sh
wc=$(pdftotext $1 - | wc -w)
echo "PDF word count: $wc"
