#!/bin/bash

echo -e "\033[0;31mUpdating system files...\033[0m"
pacman -Syyu --noconfirm

echo -e "\033[0;31mInstalling yay...\033[0m"
sudo -u hardal bash -c 'cd && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si --noconfirm && cd && rm -rf yay-bin'

echo -e "\033[0;31mInstalling packages...\033[0m"
sudo -u hardal bash -c 'xargs yay -S --noconfirm --needed <packages.txt' 

echo -e "\033[0;31mInstalling fonts...\033[0m"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMono && rm -rf JetBrainsMono.zip

echo -e "\033[0;31mInstalling icon theme...\033[0m"
echo -e '[Icon Theme]\nInherits=Qogir' > /usr/share/icons/default/index.theme

echo -e "\033[0;31mMoving dotfiles...\033[0m"
mv ~/.config ~/dotfilesbackup
git clone https://github.com/hardal7/dotfiles ~/.config 
mv ~/.config/.xinitrc ~/.xinitrc 
mv ~/.config/chrome ~/chrome

echo -e "\033[0;31mRebooting system...\033[0m"
sleep 3 && reboot

#After install: 
# move chrome folder
