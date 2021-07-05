#!/bin/sh

[ -f $HOME/.xinitrc ] && mv $HOME/.xinitrc $HOME/.xinitrc.old

git init --bare $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.cfg/ --work-tree=$HOME remote add origin git@github.com:JamesTiberiusKirk/dotcfg.git 
git --git-dir=$HOME/.cfg/ --work-tree=$HOME fetch
git --git-dir=$HOME/.cfg/ --work-tree=$HOME branch --set-upstream-to=origin/master master
#git --git-dir=$HOME/.cfg/ --work-tree=$HOME fetch origin master
git --git-dir=$HOME/.cfg/ --work-tree=$HOME pull

sudo cp ~/.config/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf
