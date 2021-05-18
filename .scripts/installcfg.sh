#!/bin/sh
git init --bare $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.cfg/ --work-tree=$HOME remote add origin git@github.com:JamesTiberiusKirk/dotcfg.git 
git --git-dir=$HOME/.cfg/ --work-tree=$HOME fetch
git --git-dir=$HOME/.cfg/ --work-tree=$HOME branch --set-upstream-to=origin/master master
git --git-dir=$HOME/.cfg/ --work-tree=$HOME pull
