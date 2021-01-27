#!/bin/sh

source=$(xclip -selection c -o)
mpv $source &
