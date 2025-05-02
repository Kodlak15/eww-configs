#!/usr/bin/env bash

battery_remaining() {
	if ! hostnamectl chassis | grep -q laptop; then
		echo -1
		exit 0
	fi
	acpi -b | awk -F ', ' '{print$2}' | awk -F '%' '{print$1}'
}

is_charging() {
	if [[ -z $(acpi -b | grep Discharging) ]]; then
		echo true
	else
		echo false
	fi
}

case "$1" in
-r | --remaining) battery_remaining ;;
-c | --charging) is_charging ;;
esac
