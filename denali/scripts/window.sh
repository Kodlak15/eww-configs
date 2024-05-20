#!/usr/bin/env bash

toggle() {
	if [[ -z "$(eww list-windows | grep "$1")" ]]; then
		echo "Window '$1' does not exist!"
		exit 0
	fi

	if [[ -z "$(eww active-windows | grep "$1")" ]]; then
		eww open "$1"
	else
		eww close "$1"
	fi
}

open() {
	# if [[ -z "$(eww active-windows | grep "$1")" ]]; then
	# 	eww open "$1"
	# fi
	eww open "$1"
}

close() {
	# if [[ -n "$(eww active-windows | grep "$1")" ]]; then
	# 	eww close "$1"
	# fi
	eww close "$1"
}

case $1 in
	--toggle) toggle $2 ;;
	--open) open $2 ;;
	--close) close $2 ;;
esac
