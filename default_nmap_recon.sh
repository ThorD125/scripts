#!/bin/bash

# Check if an IP address is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <IP_ADDRESS>"
    exit 1
fi

IP=$1

echo $IP

# Run initial nmap scan to find open ports
echo "Running initial nmap scan on $IP..."
nmap_output=$(sudo nmap "$IP" --open)

# Extract open ports from nmap output~
ports=$(echo "$nmap_output" | grep -oP '\d{1,5}/(tcp|udp) open' | cut -d'/' -f1 | tr '\n' ',' | sed 's/,$//')

# Check if any ports were found
if [ -z "$ports" ]; then
    echo "No open ports found on $IP."
    exit 0
fi

# Run detailed nmap scan with service/version detection and default scripts on the found ports
echo "Running detailed nmap scan on $IP for ports: $ports..."
sudo nmap -sV -sC -p -Pn "$ports" "$IP"
