#!/bin/bash

echo "Simple Terminal Chat using Netcat (nc)"
echo "1) Start as Server (Listener)"
echo "2) Connect as Client (Sender)"
read -p "Choose mode (1 or 2): " mode

read -p "Port to use (e.g., 4444): " port

if [ "$mode" = "1" ]; then
    echo "Starting in Server mode..."
    echo "Your IP address is: $(ip a | grep inet | grep -v 127 | awk '{print $2}' | cut -d/ -f1)"
    echo "Waiting for connection on port $port..."
    nc -l -p "$port"
else
    read -p "Enter server IP address: " ip
    echo "Connecting to $ip on port $port..."
    nc "$ip" "$port"
fi
