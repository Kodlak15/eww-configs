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
	*) echo "Invalid command..."
esac 
