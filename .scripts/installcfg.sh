#!/bin/sh

[ -f $HOME/.xinitrc ] && mv $HOME/.xinitrc $HOME/.xinitrc.old

rm -rf $HOME/.cfg

git clone --bare git@github.com:JamesTiberiusKirk/dotcfg.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no

# Powerline10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

[ -f /etc/X11/xorg.conf.d ] && sudo cp ~/.config/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf

