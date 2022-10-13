#!/bin/sh

# @author : github.com/zelsaddr
# for OpenWRT (set to rc.local for auto execute at startup)
# Check Log Message at system.log
# Requirements : 
#   - Latest grep (update via opkg install grep or via gui)
#   - sed

SETUSERNAME="" # Your WMS-lite username
SETPASSWORD="" # Your WMS-lite password
SETIFACE="wlan0" # Change with ur currently network interface, ex: wlan0, wlan1

check_ping() {
    ping -c 1 8.8.8.8 $1 >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "1"
    else
        echo "0"
    fi
}

generate_random_id(){
    echo $(echo $RANDOM | md5sum | head -c 4; echo;)
}

get_info() {
    getdata=$(curl -Ls -o /dev/null -w %{url_effective} 'http://8.8.8.8')
    echo "$getdata"
}

do_login() {
    url=$(get_info)
    gwid=$(echo $url | grep -oP 'gw_id=(.*?)\&' | sed 's/gw_id=//g' | sed 's/\&//g')
    mac=$(echo $url | grep -oP 'client_mac=(.*?)\&' | sed 's/client_mac=//g' | sed 's/\&//g')
    wlan=$(echo $url | grep -oP 'wlan=(.*?)\&' | sed 's/wlan=//g' | sed 's/\&//g')
    ipwan=$(ifconfig | grep -A 2 ''$SETIFACE'' | awk '/inet addr/{print substr($2,6)}')
    login=$(curl -s -H 'Host: welcome2.wifi.id' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'X-Requested-With: XMLHttpRequest' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Origin: http://welcome2.wifi.id' -H 'Referer: http://welcome2.wifi.id/wms/?gw_id='$gwid'&client_mac='$mac'&wlan='$wlan'' -H 'Accept-Language: en-US,en;q=0.9' --data-binary 'username_='$SETUSERNAME'&autologin_time=86000&username='$SETUSERNAME'.'$(generate_random_id)'%40wmslite..000&password='$SETPASSWORD'' 'http://welcome2.wifi.id/wms/auth/authnew/login/check_login.php?ipc='$ipwan'&gw_id='$gwid'&mac='$mac'&redirect=&wlan='$wlan'&landURL=')
    if echo "$login" | grep -q '"message":"Login Sukses"'; then
        echo "Sukses Login"
    else
        echo "Gagal Login"
    fi
}

do_logout() {
    logout=$(curl -s -H 'Host: welcome2.wifi.id' -H 'Content-Length: 0' -H 'Sec-Ch-Ua: \"-Not.A/Brand\";v=\"8\", \"Chromium\";v=\"102\"' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Sec-Ch-Ua-Mobile: ?0' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36' -H 'Sec-Ch-Ua-Platform: \"Windows\"' -H 'Origin: https://logout.wifi.id' -H 'Sec-Fetch-Site: same-site' -H 'Sec-Fetch-Mode: cors' -H 'Sec-Fetch-Dest: empty' -H 'Referer: https://logout.wifi.id/' -H 'Accept-Language: en-US,en;q=0.9' --data-binary '0' 'https://welcome2.wifi.id/authnew/logout/logoutx.php')
    if echo "$logout" | grep -q 'Logout Berhasil'; then
        echo "Sukses Logout"
    else
        echo "Gagal Logout"
    fi
}

while true; do
    if [ $(check_ping) -eq 0 ]; then
        logger "[$(date)] Tidak ada koneksi internet"
        logger "[$(date)] $(do_logout)"
        sleep 2
        logger "[$(date)] $(do_login)"
    fi
done