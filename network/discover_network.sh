#!/bin/bash

# Network Discovery Tool
# Requires: nmap, dig
#
# Usage:
# ./discover_network.sh 172.25.1.0/24

SUBNET=${1:-172.25.1.0/24}

# Convert subnet to filename friendly format
SUBNET_NAME=$(echo "$SUBNET" | tr '/' '_')

DATE=$(date +%Y%m%d_%H%M%S)

OUTDIR="./output"

mkdir -p "$OUTDIR/nmap"

HOSTS_FILE="$OUTDIR/${SUBNET_NAME}_hosts.txt"
CSV_FILE="$OUTDIR/${SUBNET_NAME}_inventory.csv"
NMAP_FILE="$OUTDIR/nmap/${SUBNET_NAME}_${DATE}.xml"

echo "Network Discovery"
echo "================="
echo "Subnet : $SUBNET"
echo

echo "# Generated $(date)" > "$HOSTS_FILE"

echo "IP,Hostname,MAC,Vendor,Open Ports" > "$CSV_FILE"


echo "[1/3] Running discovery scan..."

nmap \
  -sn \
  -oX "$NMAP_FILE" \
  "$SUBNET" >/dev/null


echo "[2/3] Extracting hosts..."


HOSTS=$(nmap -sn "$SUBNET" -oG - | awk '/Up$/{print $2}')


for IP in $HOSTS
do

    HOSTNAME=$(dig +short -x "$IP" | sed 's/\.$//' | head -1)

    if [ -z "$HOSTNAME" ]
    then
        HOSTNAME="unknown"
    fi


    MAC=$(nmap -sn "$IP" | awk '/MAC Address/ {print $3}')

    VENDOR=$(nmap -sn "$IP" | awk -F'[()]' '/MAC Address/ {print $2}')


    echo "$IP    $HOSTNAME" >> "$HOSTS_FILE"


    echo "[+] $IP $HOSTNAME"


    echo "$IP,$HOSTNAME,$MAC,$VENDOR" >> "$CSV_FILE"

done


echo
echo "[3/3] Checking common ports..."

echo
echo "Running service scan..."

nmap \
  -sV \
  -p 22,443,5988,5989 \
  "$SUBNET" \
  -oN "$OUTDIR/nmap/services_${DATE}.txt" >/dev/null


echo
echo "Completed"
echo
echo "Hosts file:"
echo " $HOSTS_FILE"
echo
echo "CSV inventory:"
echo " $CSV_FILE"
echo
echo "Raw nmap:"
echo " $NMAP_FILE"
