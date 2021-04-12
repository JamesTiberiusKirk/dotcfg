#!/bin/sh
pdftotext $1 - | wc -w
