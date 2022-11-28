#!/bin/sh

[ -f $HOME/.xinitrc ] && mv $HOME/.xinitrc $HOME/.xinitrc.old
[ -f $HOME/.xinitrc.old ] && mv $HOME/.xinitrc.old $HOME/.xinitrc.old.old
[ -d $HOME/.config/i3 ] && mv $HOME/.config/i3 $HOME/.config/i3.old

# ohmyzsh
[ -d $HOME/.oh-my-zsh ] && rm -r /home/darthvader/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerline10k
[ -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ] && rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

[ -d $HOME/.cfg ] && rm -rf $HOME/.cfg

# Need to set ssh key first in github
#git clone --bare git@github.com:JamesTiberiusKirk/dotcfg.git $HOME/.cfg
git clone --bare https://github.com/JamesTiberiusKirk/dotcfg.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no

# packer
[ -d $HOME/.local/share/nvim/site/pack/packer ] && rm -rf $HOME/.local/share/nvim/site/pack/packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Tmux tpm
[ -d $HOME/.tmux ] && rm -rf $HOME/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#[ -f /etc/X11/xorg.conf.d ] && sudo cp ~/.config/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf
