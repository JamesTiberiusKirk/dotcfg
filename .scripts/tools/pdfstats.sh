#!/bin/bash

WORD_COUNT=$(pdftotext $2 - | wc -w)
PAGE_COUNT=$(pdfinfo $2 | grep Pages)

echo "Word count: $WORD_COUNT"

