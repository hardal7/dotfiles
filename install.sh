#!/bin/bash

echo -e "\033[0;31mUpdating system files...\033[0m"
pacman -Syyu --noconfirm

echo -e "\033[0;31mInstalling yay...\033[0m"
sudo -u hardal bash -c 'cd ~ && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si --noconfirm && cd ~ && rm -rf yay-bin'

echo -e "\033[0;31mInstalling packages...\033[0m"
sudo -u hardal bash -c 'cat packages.txt | yay -S --noconfirm --needed -' 
sudo -u hardal bash -c 'mv zshrc ../.zshrc && mv zshenv ../.zshenv'

echo -e "\033[0;31mEnabling services...\033[0m"
systemctl enable sshd NetworkManager

#After install: 
# move chrome folder
# asoundconf list
