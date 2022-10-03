#!/data/data/com.termux/files/usr/bin/bash
#!/bin/bash
# Tools ladank Installer
# coded By AfudiiKun
# facebook @afdipratama
clear

blue='\e[0;34'
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'

# CTRL C
trap ctrl_c INT
ctrl_c() {
clear
echo -e $red"[#]> (Ctrl + C ) Detected, Trying To Exit "
sleep 1
echo ""
echo -e $green"[#]> Thx4 Installin' da tool "
sleep 1
echo ""
read enter
exit
}

echo -e $red"           .__         ______________________________       "
echo -e $white"           |  |   ____ \_   ___ \__    ___/\______   \_____  "
echo -e $red"           |  | _/ __ \/    \  \/ |    |    |       _/\__  \ "
echo -e $white"           |  |_\  ___/\     \____|    |    |    |   \ / __ \_"
echo -e $red"	   |____/\___  >\______  /|____|    |____|_  /(____  /"
echo -e $white"	             \/        \/                  \/      \/"
echo -e $red"          #####################################################"
echo -e $white"          # $white  SGB Member Priv8 Tools Installer  $white           #"
echo -e $red"          # $white 		happy works ~ afudikun        $white        #"
echo -e $white"          # $white 		contact : lectra5ix@gmail.com  $white       #"
echo -e $red"       	  #$white Greetz : 405 - SGB TEAM -  - DarkSide Est #"
echo -e $white"  	  # $white 		Copyright : ./LecTra5ix     $white          #"
echo -e $red"          #####################################################"
echo ""

echo -e $white" 1.SGB Spotify Acc Creator Auto Verif"
echo -e $red" 2.SGB Booking.com Acc Creator"
echo -e $white" 3.SGB Netflix 4 Every0ne"
echo -e $red" 4.SGB Shopee Scraper [ BETA ]"
echo -e $white" 5. SGB Instagram Follow Tools [Maintenance]"
echo -e $red" 6.SGB Whatstalk"
echo -e $white" 7.SGB C9 Auto Create"
echo -e $red "8.SGB Instagram FFT"
echo -e $white "9.Indocheck Auto Get SMTP"
read -p "[CuanInstaller]> " act;

if [ $act = 1 ]
then
clear
echo -e $white" Installing Spocreate By Ikballnh SGB Team"
sleep 1
sudo apt update && apt upgrade
sudo apt install php
pkg install php
git clone https://github.com/ikballnh/spocreate
echo -e $red"Installation Success |  Baca Readme Kalau Gak Ngerti :)"
fi

if [ $act = 2 ]
then
clear
echo -e $white "Installing Booking.com Acc Creator By SGB Team"
sleep 1
sudo apt install php
sudo apt install curl
pkg install php
pkg install curl
mkdir bocom
cd bocom
wget -O bocom.php https://pastebin.com/raw/5utd62rp
cd ..
echo -e $red"Installation Success | Baca Readme Kalau Gak Ngerti :)"
fi

if [ $act = 3 ]
then
clear
echo -e $white "Installing Netflix 4 Everyone By RadityaFiqa SGB Team"
sleep 1
sudo apt install nodejs
sudo apt install npm
pkg install nodejs
pkg install npm
mkdir netflix4ev
cd netflix4ev
git clone https://github.com/RadityaFiqa/Netflix-For-Everyone
cd ..
sleep 1
echo $red "Installation Success | Baca Readme Kalau Gak Ngerti :)"
fi

if [ $act = 4 ]
then
clear
echo -e $white "Installing Shopee Data Scraper [ BETA ] By Ghazi SGB Team"
apt install python
apt install pip
pkg install python
pkg install python2

mkdir shopeescrape
cd shopeescrape
git clone https://github.com/ghazimuharam/scrape-id
pip install -r requirements.txt
cd ..
fi

if [ $act = 5 ] 
then
clear
echo -e $white "Installing Instagram Follow [ Maintenance ] By SGB Team"
apt install python
apt install pip
mkdir instafoll
cd instafoll
echo -e $white "LAGI GABISA TOLO"
cd ..
echo -e $red"Installation Success | baca Reade Kalau Gak Ngerti :)"
fi

if [ $act = 6 ]
then
clear
echo -e $white "Installing Whatstalk BY pr0ph0z SGB Team"
mkdir Whatstalk
cd Whatstalk
git clone https://github.com/pr0ph0z/whatstalk
cd ..
fi

if [ $act = 7 ]
then
clear
echo -e $white "Installing C9 Auto Create"
mkdir c9ac
cd c9ac
echo -e $lightgreen "Lagi gabisa tolo"
cd ..
fi

if [ $act = 8 ]
then
clear
echo -e $red "Installting FFT Tools Instagram By Sanji SGB Team"
sudo apt install npm
sudo apt install node
mkdir sbot
cd sbot
git clone https://github.com/sanjidtk/sbot
cd ..
fi

if [ $act = 9 ]
then
clear
echo -e $red "installing auto get SMTP by Jiwa Terlena X pandshop Indocheck"
sudo apt install python
sudo apt install python-pip
apt install python-pip
apt install python3-pip
mkdir smtpawtoget
cd smtpawtoget
wget -O smtp.py https://raw.githubusercontent.com/dudulpea/smtp/master/tw.py?fbclid=IwAR2TK1snuaq_LUd6eDPYloRZux5I2C_W22wDZzjOzoIMxy9fp7Xb4HRMWWo
cd ..
fi

