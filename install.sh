#!/bin/bash

#Update system
echo "Updating system files..."
pacman -Syu --noconfirm

#Install packages
echo "Installing packages..."

pacman -S networkmanager acpi ufw brightnessctl playerctl dunst rofi flameshot nano vim neovim neofetch bottom htop duf ncdu fish lsd exa lf wget mandoc unzip arch-install-scripts base-devel ttf-dejavu xclip ripgrep vlc discord kitty spotify firefox python python-pip ruby npm autorandr qtile mypy xorg xorg-xinit xorg-fonts-misc --noconfirm

#Install yay
echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm && cd 
yay -S picom-git spotify rofi-greenclip pistol-git --noconfirm

#Install graphics drivers (AMD)
echo "Installing graphics drivers..."
pacman -S xf86-video-ati --noconfirm

#Font setup
echo "Installing fonts..."
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip -d /usr/share/fonts/JetBrainsMono

#Cursor theme setup
echo "Installing cursor theme..."
yay -S qogir-icon-theme --noconfirm
echo -e '[Icon Theme]\nInherits=Qogir' > /usr/share/icons/default/index.theme

#BetterDiscord setup
echo "Installing BetterDiscord..."
git clone https://github.com/BetterDiscord/BetterDiscord.git && cd BetterDiscord
npm install -g pnpm && pnpm install && pnpm build && cd

#Spicetify setup
echo "Installing Spicetify"
yay -S spicetify-cli --noconfirm
chmod a+wr /opt/spotify
chmod a+wr /opt/spotify/Apps -R

#Installing study related stuff
echo "Installing latex and libreoffice"
pacman -S zathura zathura-pdf-poppler libreoffice-fresh texlive-latex texlive-binextra texlive-luatex --noconfirm
yay -S ttf-times-new-roman --noconfirm

#Enabling sound
echo "Configuring sound and backlight..."
pacman -S pulseaudio-alsa --noconfirm
gpasswd -a hardal audio
mkdir -p /etc/pulse/default.pa
yay -S asoundconf --noconfirm
asoundconf set-default-card Master

#Moving dotfiles
echo "Moving dotfiles..."
echo "(You can find your old config files in dotfilesbackup)"
mv .config dotfilesbackup
git clone https://github.com/hardal7/dotfiles .config 
mv dotfiles/.xinitrc .xinitrc 

#Delete folders and make shell scripts executable
echo "Finalizing"
rm -rf yay JetBrainsMono.zip
chmod +x ~/.config/qtile/startup.sh
chmod +x ~/.config/qtile/battery_check.sh

#LF img setup
chmod +x ~/.config/lf/lf_kitty_{clean,preview}

#Reboot
echo "Rebooting system..."
sleep 3 && reboot

