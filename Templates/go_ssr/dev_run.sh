#!/bin/sh
source .env
reflex -d none -sr '.*\.(go|gohtml|env)$' -- go run go_ssr
