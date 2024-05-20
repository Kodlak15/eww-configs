#!/usr/bin/env bash

is_muted() {
	if [[ -z "$(amixer | grep "Front Left: Playback" | grep "off")" ]]; then
		echo false
	else
		echo true
	fi
}

case $1 in
	--muted) is_muted ;;
esac
