#!/usr/bin/env bash

is_muted() {
	if [[ -z "$(amixer | grep "Front Left: Playback" | grep "off")" ]]; then
		echo false
	else
		echo true
	fi
}

# get_sink_id() {
# 	wpctl status | grep '\*' -m 1 | awk -F '   ' '{print $2}' | awk -F '.' '{print $1}'
# }
#
# set_volume() {
# 	wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
# }

case $1 in
--muted) is_muted ;;
esac
