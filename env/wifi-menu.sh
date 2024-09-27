#!/bin/bash

# Function to connect to a WiFi network
connect_to_wifi() {
    local ssid="$1"
    local password

    # Prompt for password
    echo -n "Enter password for $ssid: "
    read -s password
    echo

    # Connect to the network
    nmcli device wifi connect "$ssid" password "$password"
}

# Get list of available WiFi networks
networks=$(nmcli --fields SSID,RATE,BARS device wifi list | tail -n +2)

# Use fzf to select a network
selected=$(echo "$networks" | fzf --reverse --header="Select WiFi Network")

# Extract SSID from selection
ssid=$(echo "$selected" | awk '{print $1}')

# If a network was selected, attempt to connect
if [ -n "$ssid" ]; then
    connect_to_wifi "$ssid"
else
    echo "No network selected."
fi
