#!/bin/bash

echo -e "\033[0;31mUpdating system files...\033[0m"
pacman -Syyu --noconfirm

echo -e "\033[0;31mInstalling yay...\033[0m"
sudo -u hardal bash -c 'cd ~ && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si --noconfirm && cd ~ && rm -rf yay-bin'

echo -e "\033[0;31mInstalling packages...\033[0m"
sudo -u hardal bash -c 'cat packages.txt | yay -S --noconfirm --needed -' 

echo -e "\033[0;31mSetting icon theme...\033[0m"
echo -e '[Icon Theme]\nInherits=Qogir' > /usr/share/icons/default/index.theme

echo -e "\033[0;31mMoving dotfiles...\033[0m"
git clone https://github.com/hardal7/dotfiles ~/.config 

echo -e "\033[0;31mEnabling services...\033[0m"
systemctl --user enable sshd mpd NetworkManager

echo -e "\033[0;31mRebooting system...\033[0m"
sleep 3 && reboot

#After install: 
# move chrome folder
