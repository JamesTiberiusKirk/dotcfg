#!/bin/sh

# Installing packages from base repos
sudo pacman -S --needed - < base_package_list.txt

# Installing yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf yay

# Installing packages from comunity repos
yay  -S --needed - < comunity_package_list.txt
