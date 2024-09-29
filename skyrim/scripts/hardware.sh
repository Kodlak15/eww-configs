#!/usr/bin/env bash

core_temp() {
	temp_sum=0
	cores=8

	for ((i = 0; i < cores; i++)); do
		temp="$(sensors | grep "Core $i" | awk -F '+' '{print $2}' | awk -F '°' '{print $1}')"
		temp_sum="$(echo "$temp_sum + $temp" | bc)"
	done

	echo "$temp_sum / $cores" | bc 
}

cpu_usage() {
	idle="$(vmstat 1 2 | tail -1 | awk '{print $15}')"
	echo "100 - $idle" | bc
}

gpu_temp() {
	nvidia-smi | grep -A 4 "Temp" | tail -n 1 | awk -F ' ' '{print $3}' | awk -F 'C' '{print $1}'
}

gpu_usage() {
	nvidia-smi | grep -A 4 "Temp" | tail -n 1 | awk -F ' ' '{print $5}' | awk -F 'W' '{print $1}'
}

case $1 in 
	--core-temp) core_temp ;;
	--cpu-usage) cpu_usage ;;
	--gpu-temp) gpu_temp ;;
	--gpu-usage) gpu_usage ;;
esac
