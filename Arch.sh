#!/bin/bash
echo " Hyprland "
sudo pacman -Sy hyprland

echo " Themes "
git clone https://github.com/vinceliuice/Lavanda-gtk-theme.git
cd Lavanda-gtk-theme
./install.sh -t sea -c dark -l

echo " Icons "
git clone https://github.com/daniruiz/flat-remix.git
cd flat-remix
sudo make install

echo " Cursors "
sudo pacman -S xorg-xcursorgen xmlstarlet librsvg
git clone https://github.com/sevmeyer/mocu-xcursor.git
cd mocu-xcursor
./make.sh
cd dist
sudo cp -r Mocu-Black-Right /usr/share/icons

echo " Grub "
cd grub
sudo cp -r charm /usr/share/grub/themes
sudo cp grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo " Utils "
sudo pacman -S wofi swww mako
sudo pacman -S ttf-jetbrains-mono-nerd ttf-hanazono ttf-baekmuk noto-fonts-emoji
sudo pacman -S btop bluez bluez-utils blueberry mpv imv nwg-look nwg-displays emptty gnome-text-editor file-roller wine-staging winetricks
sudo pacman -S alacritty nemo firefox telegram-desktop spotify-launcher steam discord

echo " Depencies "
sudo pacman -S alsa-utils pamixer brightnessctl xdg-user-dirs grim slurp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S light catnap-git
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
