#!/bin/bash

# ------ Variables ------ #

APPS_TO_INSTALL=(
  flameshot
  gnome-tweaks
  neofetch
  cheese
  timeshift
  snapd
)

URL_VIVALDI="https://downloads.vivaldi.com/stable/vivaldi-stable_5.1.2567.66-1_amd64.deb"
URL_DISCORD_CANARY="https://discord.com/api/download/canary?platform=linux&format=deb"
URL_HYPER_TERMINAL="https://releases.hyper.is/download/deb"
URL_4K_VIDEO_DOWNLOADER="https://dl.4kdownload.com/app/4kvideodownloader_4.20.1-1_amd64.deb?source=website"
URL_TICKTICK="https://appest-public.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-0.0.5-amd64.deb"
URL_MEGASYNC="https://mega.nz/linux/repo/xUbuntu_21.10/amd64/megasync-xUbuntu_21.10_amd64.deb"

DOWNLOADS_DIRECTORY="$HOME/Downloads/softwares"

# ------------ #


### Atualizando a parada toda
sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt full-upgrade
sudo apt install -f
sudo apt update -y
sudo apt autoclean
flatpak update


### Download e instalação dos programas externos
mkdir "$DOWNLOADS_DIRECTORY"
wget -c "$URL_VIVALDI" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_DISCORD_CANARY" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_HYPER_TERMINAL" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_4K_VIDEO_DOWNLOADER" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_TICKTICK" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_MEGASYNC" -P "$DOWNLOADS_DIRECTORY"

sudo dpkg -i $DOWNLOADS_DIRECTORY/*.deb


### Instação dos programas no APT
for app_name in ${APPS_TO_INSTALL[@]}; do
  if ! dpkg -i | grep -q $app_name; then
    sudo apt install "$app_name" -y
  else
    echo "[Programa instalado] - $app_name"
  fi
done

sudo apt install -f
# sudo apt-get install ubuntu-restricted-extras


### Instalando pacotes Flatpak
flatpak install figma
flatpak install spotify
flatpak install blender
flatpak install slack
flatpak install flathub com.obsproject.Studio
flatpak install flathub org.gimp.GIMP
flatpak install flathub org.videolan.VLC
flatpak install flathub org.onlyoffice.desktopeditors
# flatpak install flathub re.sonny.Tangram


# ------ Última atualização ------ #

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt full-upgrade
sudo apt autoclean
sudo apt install -f
flatpak update
# sudo reboot now
