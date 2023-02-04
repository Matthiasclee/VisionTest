#!/bin/bash

# Install programs in necessary
if [ "$(which nmap)" == "" ]; then
  sudo apt install nmap -y
fi
if [ "$(which jq)" == "" ]; then
  sudo apt install jq -y
fi

nmap_out="$(nmap 192.168.0.0/24 -p 5582 --open | grep -oP '((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}')"
readarray nmap_out_arr <<< "$nmap_out"

if [ "$1" == "--no-server-info" ]; then
  echo "$nmap_out"
  exit
fi

for ip in "${nmap_out_arr[@]}"; do
  # open socket
  ip=${ip::-1}
  exec 3<>/dev/tcp/$ip/5582
  
  # get json
  json=$(head -n1 <&3)

  # close socket
  exec 3>&-

  # get server data
  id_server=$(echo $json | jq -r .contents)
  IFS="~" read -a id_server_split <<< $id_server

  echo "$ip ${id_server_split[0]} ${id_server_split[1]} ${id_server_split[2]}"
done
