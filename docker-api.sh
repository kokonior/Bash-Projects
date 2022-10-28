
#!/bin/bash

N='\033[0m'
R='\e[38;5;196m'
G='\e[38;5;82m'

scan(){
    req=$(curl -m 2 -s -k $1:2375/info)
    ret=$(echo $req | grep -Po '(?<=\"ServerVersion\":\").*?(?=\")')
    res=$(echo $req | grep -Po '(?<=\"OperatingSystem\":\").*?(?=\")')
    if [[ -z $ret ]]; then
    echo -e "${R}$1${N}"
    elif [[ $ret =~ "20" ]]; then
    echo -e "${G}$1${N} | $ret | $res"
    echo -e "$1:2375 | $ret | $res" >> api-20.txt

    else
    echo -e "${G}$1${N} | $ret | $res"
    echo -e "$1:2375" >> import.txt
    echo -e "$1:2375 | $ret | $res" >> api.txt
    fi
}
ws(){
    mek=$(echo $1)
    scan $mek
}
read -p "list: " l
if [[ ! -f $l ]]; then
echo "not found"
exit 1
fi

IFS=$'\r\n'
for i in $(cat $l); do
ws $i
done
