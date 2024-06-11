#!/usr/bin/env bash

get_server_name() {
	mullvad status | head -n 1 | awk -F ' ' '{print $3}'
}

get_server_ip() {
	mullvad status | tail -n 1 | awk -F 'IPv4: ' '{print $2}'
}

case "$1" in 
	--server-name) get_server_name;;
	--server-ip) get_server_ip;;
esac
