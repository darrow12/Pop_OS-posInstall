#!/bin/bash

# ------ Variables ------ #

APPS_TO_INSTALL=(
  vim
  git
  curl
  snapd
  flameshot
  gnome-tweaks
  cheese
  timeshift
  audacity
  neofetch
  cmatrix
  yes
  cowsay
)

URL_VIVALDI="https://downloads.vivaldi.com/stable/vivaldi-stable_5.3.2679.38-1_amd64.deb"
URL_DISCORD="https://dl.discordapp.net/apps/linux/0.0.17/discord-0.0.17.deb"
URL_HYPER_TERMINAL="https://github.com/vercel/hyper/releases/download/v3.2.3/hyper_3.2.3_amd64.deb"
URL_4K_VIDEO_DOWNLOADER="https://dl.4kdownload.com/app/4kvideodownloader_4.20.4-1_amd64.deb"
URL_TICKTICK="https://appest-public.s3.amazonaws.com/download/linux/linux_deb_x64/ticktick-1.0.11-amd64.deb"
URL_MEGASYNC="https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb"
URL_VSCODE="https://az764295.vo.msecnd.net/stable/c3511e6c69bb39013c4a4b7b9566ec1ca73fc4d5/code_1.67.2-1652812855_amd64.deb"


DOWNLOADS_DIRECTORY="$HOME/Downloads/softwares"

# ------ When the script begins ------ #

clear
echo "P)ppppp                           O)oooo   S)ssss "
echo "P)    pp                         O)    oo S)    ss"
echo "P)ppppp   o)OOO  p)PPPP          O)    oo  S)ss   "
echo "P)       o)   OO p)   PP         O)    oo      S) "
echo "P)       o)   OO p)   PP         O)    oo S)    ss"
echo "P)        o)OOO  p)PPPP  #######  O)oooo   S)ssss "
echo "                 p)                               "
echo "                 p)                               "
echo "                                ##                   t)           l)L  l)L  "
echo "                                                   t)tTTT          l)   l)  "
echo "p)PPPP   o)OOO   s)SSSS         i) n)NNNN   s)SSSS   t)   a)AAAA   l)   l)  "
echo "p)   PP o)   OO s)SSSS  ####### i) n)   NN s)SSSS    t)    a)AAA   l)   l)  "
echo "p)   PP o)   OO      s)         i) n)   NN      s)   t)   a)   A   l)   l)  "
echo "p)PPPP   o)OOO  s)SSSS          i) n)   NN s)SSSS    t)T   a)AAAA l)LL l)LL "
echo "p)                                                                          "
echo "p)                                                                              by: Darrow"
echo ""
echo ""
echo "Take a sit, wait, and be prepared to press y sometimes."
echo "Have fun with your coffee :)"
echo ""

# ------ Folder structure ------ #
echo "[📁 Making the folder structure]"
echo ""

mkdir .themes
mkdir .icons
mkdir .webapps
mkdir code
cd Pictures/
mkdir Screenshots
mkdir Storage
mkdir Memes
mkdir Wallpapers
cd ..
cd Videos/
mkdir Memes
cd ..

# ------ Installing APT packages ------ #
echo "[📦 Installing APT packages]"
echo ""

for app_name in ${APPS_TO_INSTALL[@]}; do
  if ! dpkg -i | grep -q $app_name; then
    sudo apt install -y "$app_name"
  else
    echo "[$app_name installed]"
  fi
done

sudo apt update
sudo apt install -f

# ------ Installing softwares ------ #
echo "[📥 Downloading and installing external software]"
echo ""

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

# ------ Installing Flatpak packages ------ #
echo "[📦 Installing Flatpak packages]"
echo ""

flatpak install figma -y
flatpak install spotify -y
flatpak install slack -y
flatpak install flathub org.blender.Blender -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub org.onlyoffice.desktopeditors -y

# ------ Installing Node ------ #
echo "[📌 Installing Node.js]"
echo ""

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
nvm install v16.15.1

# ------ Installing some packages ------ #
echo "[📦 Installing others packages]"
echo ""

npm i sass -g
npm install -g nativefier
npm install -g nodemon
snap install asciiquarium
sudo apt update
sudo apt install -f

# ------ Installing Yarn ------ #
echo "[📦 Installing Yarn]"
echo ""
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends yarn
export PATH="~/.bashrc:`yarn global bin`"

# ------ CapsLock delay fixer ------ #
echo "[📝 Fixing capslock delay]"
echo ""

git clone https://github.com/hexvalid/Linux-CapsLock-Delay-Fixer.git
cd Linux-CapsLock-Delay-Fixer/
mv bootstrap.sh ..
cd ..
bash -ic "sh bootstrap.sh"
rm -r Linux-CapsLock-Delay-Fixer/

# ------ Updating all ------ #
echo "[⚡ Almost in the end! Updating all the things]"
echo ""

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade
sudo apt full-upgrade
sudo apt autoclean
sudo apt install -f
flatpak update

# ------ Installation completed ------ #

clear
neofetch
echo "📁 Your archives ⤵"
echo ""
ls
echo ""
echo "✅ Installation completed!"
echo "Enjoy your new computer! 💻"
echo ""
echo "💬 If you have any questions, please contact me on Discord: Darrow#9826"
echo ""
cowsay Have fun!
