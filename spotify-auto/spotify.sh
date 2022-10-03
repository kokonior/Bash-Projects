#!/bin/bash
clear
sleep 0.5
purple='\033[0;35m'
red='\033[0;31m'
cyan='\033[0;36m'
yell='\033[1;33m'
white="\e[37m"
green='\033[92m'
trap ctrl_c INT
ctrl_c() {
clear
printf "$white[$red CTRL + C$white ] Tunggu 3 Detik..."
sleep 3
clear
exit
}
echo ""
  printf "$green

	 ██░ ██  ▄▄▄       ▄████▄   ██ ▄█▀▄▄▄█████▓ ▒█████   ▄▄▄▄   ▓█████  ██▀███
	▓██░ ██▒▒████▄    ▒██▀ ▀█   ██▄█▒ ▓  ██▒ ▓▒▒██▒  ██▒▓█████▄ ▓█   ▀ ▓██ ▒ ██▒
	▒██▀▀██░▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒ ▓██░ ▒░▒██░  ██▒▒██▒ ▄██▒███   ▓██ ░▄█ ▒
	░▓█ ░██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ░ ▓██▓ ░ ▒██   ██░▒██░█▀  ▒▓█  ▄ ▒██▀▀█▄
	░▓█▒░██▓ ▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄  ▒██▒ ░ ░ ████▓▒░░▓█  ▀█▓░▒████▒░██▓ ▒██▒
	 ▒ ░░▒░▒ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒  ▒ ░░   ░ ▒░▒░▒░ ░▒▓███▀▒░░ ▒░ ░░ ▒▓ ░▒▓░
	 ▒ ░▒░ ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░    ░      ░ ▒ ▒░ ▒░▒   ░  ░ ░  ░  ░▒ ░ ▒░
	 ░  ░░ ░  ░   ▒   ░        ░ ░░ ░   ░      ░ ░ ░ ▒   ░    ░    ░     ░░   ░
	 ░  ░  ░      ░  ░░ ░      ░  ░                ░ ░   ░         ░  ░   ░
        	          ░                                       ░"

printf "$white \n   	   =  	    	                                        ="
printf "\n"
printf "$white	   ======================================================\n"
printf "$white		   -=SGB TEAM | HEXPLOIT | 405 | INDOSEC=-\n"
printf "$white 	   	      -=SPOTIFY ACCOUNT CREATOR UNLIMITED=- \n"
printf "$white 			        -=BY 0xlAp#!=-\n"
printf "$white"
cat <<EOF
EOF
daftar(){
	random=$(echo $RANDOM)
	curl=$(curl -s "https://spclient.wg.spotify.com:443/signup/public/v1/account/" --data "iagree=true&birth_day=15&platform=Android-ARM&creation_point=client_mobile&password=$pswd&key=142b583129b2df829de3656f9eb484e6&birth_year=1999&email=$user.$random@mailnesia.com&gender=male&app_version=849800892&birth_month=12&password_repeat=$pswd")
	status=$(echo $curl | grep -Po '(?<=status":)[^},]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{1|}\)//g')
	if [[ $status =~ "1" ]]; 
    	then
        	date +%H:%M:%S
        	printf "$white[$green Success Generate$white ] => $user.$random@mailnesia.com|$pswd\n"
        	echo "[ Sukses ]$user.$random@mailnesia.com|$pswd" >> account.txt
	else
        	date +%H:%M:%S
		printf "$white[$red Failed$white ] => $user.$random@mailnesia.com|$pswd\n"
	fi
}
read -p "Jumlah Akun Spotify : "  jumlah
read -p "Masukan Username    : " user
read -p "Masukan Password    : " pswd
for (( i = 0; i < $jumlah; i++ )); do
	daftar $user $pswd
done
 
