#!/usr/bin/env bash

launch_mullvad_applet() {
	exec mullvad-vpn &
}

get_server_name() {
	mullvad status | head -n 1 | awk -F ' ' '{print $3}'
}

get_server_ip() {
	mullvad status | tail -n 1 | awk -F 'IPv4: ' '{print $2}'
}

get_host_ip() {
	ifconfig | grep "inet" | awk 'NR==2' | xargs | awk -F ' ' '{print $2}'
}

status() {
	mullvad status | head -n 1 | awk -F ' ' '{print $1}'
}

toggle() {
	status="$(status)"
	if [[ "$status" == "Connecting" ]]; then
		status="Connected"
	fi

	case "$status" in
		"Connected") mullvad disconnect;;
		"Disconnected") mullvad connect;;
	esac

	echo "$status" >> "./listen/mullvad-state"
}

case "$1" in 
	--applet) launch_mullvad_applet;;
	--server-name) get_server_name;;
	--server-ip) get_server_ip;;
	--host-ip) get_host_ip;;
	--status) status;;
	--toggle) toggle;;
esac
