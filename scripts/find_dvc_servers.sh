#!/bin/bash

# Install programs in necessary
if [ "$(which nmap)" == "" ]; then
  echo "Installing Nmap"
  sudo apt install nmap -y
fi
if [ "$(which jq)" == "" ]; then
  echo "Installing JQ"
  sudo apt install jq -y
fi

network_info=$(ip -o -f inet addr show | awk '/scope global/ {print $4}')
IFS='/' read -r -a network_array <<< "$network_info"
ip_address="${network_array[0]}"
subnet="${network_array[1]}"

echo "Scanning Network..."

nmap_out="$(nmap "$ip_address/$subnet" -p 5583 --open | grep -oP '((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)\.?\b){4}')"
readarray nmap_out_arr <<< "$nmap_out"

echo "Done!"

if [ "$1" == "--no-server-info" ]; then
  echo "$nmap_out"
  exit
fi

for ip in "${nmap_out_arr[@]}"; do
  # open socket
  ip=${ip::-1}
  exec 3<>/dev/tcp/$ip/5583
  
  # get json
  json=$(head -n1 <&3)

  # close socket
  exec 3>&-

  # get server data
  id_server=$(echo $json | jq -r .contents)
  IFS="~" read -a id_server_split <<< $id_server

  echo "$ip ${id_server_split[0]} ${id_server_split[1]} ${id_server_split[2]}"
done
