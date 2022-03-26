#!/bin/bash

# ------ Variables ------ #

APPS_TO_INSTALL=(
  flameshot
  gnome-tweaks
  neofetch
  cheese
  timeshift
  snapd
  git
  vim
  audacity
  cmatrix
  curl
)

URL_VIVALDI="https://downloads.vivaldi.com/stable/vivaldi-stable_5.1.2567.66-1_amd64.deb"
URL_DISCORD="https://dl.discordapp.net/apps/linux/0.0.17/discord-0.0.17.deb"
URL_HYPER_TERMINAL="https://github.com/vercel/hyper/releases/download/v3.2.0/hyper_3.2.0_amd64.deb"
URL_4K_VIDEO_DOWNLOADER="https://dl.4kdownload.com/app/4kvideodownloader_4.20.1-1_amd64.deb"
URL_TICKTICK="https://appest-public.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-0.0.5-amd64.deb"
URL_MEGASYNC="https://mega.nz/linux/repo/xUbuntu_21.10/amd64/megasync-xUbuntu_21.10_amd64.deb"
URL_VSCODE="https://az764295.vo.msecnd.net/stable/c722ca6c7eed3d7987c0d5c3df5c45f6b15e77d1/code_1.65.2-1646927742_amd64.deb"

DOWNLOADS_DIRECTORY="$HOME/Downloads/softwares"

# ------------ #

### Atualizando a parada toda
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt full-upgrade -y
sudo apt install -f
sudo apt update -y
flatpak update -y

### Download e instalação dos programas externos
mkdir "$DOWNLOADS_DIRECTORY"
wget -c "$URL_VIVALDI" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_DISCORD" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_HYPER_TERMINAL" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_4K_VIDEO_DOWNLOADER" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_TICKTICK" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_MEGASYNC" -P "$DOWNLOADS_DIRECTORY"
wget -c "$URL_VSCODE" -P "$DOWNLOADS_DIRECTORY"

sudo dpkg -i $DOWNLOADS_DIRECTORY/*.deb
sudo apt install -f

### Instação dos programas no APT
for app_name in ${APPS_TO_INSTALL[@]}; do
  if ! dpkg -i | grep -q $app_name; then
    sudo apt install -y "$app_name"
  else
    echo "[Programa instalado] - $app_name"
  fi
done

sudo apt update
sudo apt install -f
# sudo apt-get install ubuntu-restricted-extras

### Instalação do Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
nvm list-remote
nvm install v16.14.2

### Instalando pacotes Flatpak
flatpak install figma -y
flatpak install spotify -y
flatpak install slack -y
flatpak install flathub org.blender.Blender -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub org.onlyoffice.desktopeditors -y

# ------ Última atualização ------ #

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt full-upgrade
sudo apt autoclean
sudo apt install -f
flatpak update
# sudo reboot now
