#!/usr/bin/env bash

librewolf() {
	exec librewolf &
}

firefox() {
	exec firefox-devedition &
}

spotify() {
	exec spotify &
}

steam() {
	if [[ -n "$(command -v nvidia-offload)" ]]; then
		exec nvidia-offload steam &
	else
		exec steam &
	fi
}

discord() {
	exec webcord &
}

obs() {
	exec obs &
}

gimp() {
	exec gimp &
}

logseq() {
	exec logseq &
}

wireshark() {
	WAYLAND_DISPLAY="$XDG_RUNTIME_DIR/$WAYLAND_DISPLAY"
	exec wireshark &
}

mullvad() {
	exec mullvad-vpn &
}

run() {
	case "$1" in
	--librewolf) librewolf ;;
	--firefox) firefox ;;
	--spotify) spotify ;;
	--steam) steam ;;
	--discord) discord ;;
	--obs) obs ;;
	--wireshark) wireshark ;;
	--gimp) gimp ;;
	--logseq) logseq ;;
	--mullvad) mullvad ;;
	*) echo "Invalid command..." ;;
	esac
}

max_retries=3
delay=2
attempt=1

# Make sure process is properly cleaned up when the application is closed
while [ $attempt -le $max_retries ]; do
	if run "$@"; then
		break
	else
		echo "Command failed on attempt $attempt"
		attempt=$((attempt + 1))
		if [ $attempt -le $max_retries ]; then
			echo "Retrying in $delay seconds..."
			sleep $delay
		else
			echo "Reached maximum retries. Command failed."
		fi
	fi
done
