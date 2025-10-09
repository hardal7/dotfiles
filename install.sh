#!/bin/bash

echo -e "\033[0;31mUpdating system files...\033[0m"
sudo pacman -Syyu --noconfirm

echo -e '\033[0;31mInstalling packages...\033[0m'
sudo -u hardal bash -c 'cat packages.txt | pacman -S --noconfirm --needed -' 

echo -e '\033[0;Configuring system...\033[0m'
bash -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
bash -c 'git clone -b main --depth=1 https://github.com/uiriansan/SilentSDDM && cd SilentSDDM && ./install.sh'
bash -c 'wget https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz'
bash -c 'tar -xvf zen.linux-x86-64.tar.xz && rm zen.linux-x86-64.tar.xz && mv zen ~/zen'
bash -c 'cp kat.sh ~/kat.sh && cp zshrc ../.zshrc && cp zshenv ../.zshenv'
bash -c 'mkdir ~/Pictures'
bash -c 'chsh -s /bin/zsh hardal'

echo -e "\033[0;31mEnabling services...\033[0m"
sudo systemctl enable sshd NetworkManager sddm
