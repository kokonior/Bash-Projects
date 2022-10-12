#!/bin/bash

req=$(curl "https://ip.seeip.org/jsonip" --silent)
ip=$(echo $req | jq -r .ip)
echo "you ip : ${ip}"
