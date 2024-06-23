#!/usr/bin/env bash

launch_mullvad_applet() {
	exec mullvad-vpn &
}

get_server_name() {
	mullvad status | head -n 1 | awk -F ' ' '{print $3}' 2>/dev/null
}

get_server_ip() {
	mullvad status | tail -n 1 | awk -F 'IPv4: ' '{print $2}' 2>/dev/null
}

get_host_ip() {
	ifconfig | grep "inet" | awk 'NR==2' | xargs | awk -F ' ' '{print $2}'  2>/dev/null
}

status() {
	mullvad status | head -n 1 | awk -F ' ' '{print $1}' 2>/dev/null
}

toggle() {
	current_status="$(status)"
	case "$current_status" in
		"Connected") 
			mullvad disconnect
			echo "Disconnected" > "./listen/mullvad-state"
			;;
		"Disconnected") 
			mullvad connect
			echo "Connected" > "./listen/mullvad-state"
			;;
	esac
}

case "$1" in 
	--applet) launch_mullvad_applet;;
	--server-name) get_server_name;;
	--server-ip) get_server_ip;;
	--host-ip) get_host_ip;;
	--status) status;;
	--toggle) toggle;;
esac
