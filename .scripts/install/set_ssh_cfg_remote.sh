#!/bin/sh

# This needs to be done after generating the ssh key and adding it to github
git --git-dir=$HOME/.cfg/ --work-tree=$HOME remote set-url origin git@github.com:JamesTiberiusKirk/dotcfg.git
