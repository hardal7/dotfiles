#!/bin/bash

echo -e '\033[0;31mInstalling packages...\033[0m'
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si && cd .. && mv yay-bin/pkg/yay-bin ~/.local/bin/yay && rm -rf yay-bin
sudo yay -S --noconfirm --needed $(cat packages.txt)

echo -e '\033[0;31mSetting up greeter...\033[0m'
sudo sed -i "15c\\background = rei.mp4" /usr/share/sddm/themes/silent/configs/default.conf
sudo sed -i "58c\\background = rei.mp4" /usr/share/sddm/themes/silent/configs/default.conf

echo -e '\033[0;31mMoving files...\033[0m'
cp .zshrc ~/ && cp zshenv ~/ cp icons ~/.icons
bat cache --build
mkdir ~/Pictures ~/Desktop ~/Downloads

echo -e '\033[0;31mInstalling shell...\033[0m'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "\033[0;31mSetting up MPD...\033[0m"
sudo gpasswd -a mpd hardal 
sudo chmod 710 /home/hardal
mkdir ~/.local/state/mpd

echo -e "\033[0;31mEnabling services...\033[0m"
sudo systemctl enable sddm sshd tor bluetooth mpd.socket
systemctl enable --user mpd

echo -e "\033[0;31mInstallation completed, you may reboot your system.\033[0m"
