#!/usr/bin/env bash

temp() {
	temp="$(tweather --opts temp | awk -F '.' '{print $1}')"
	echo "$temp°F"
}

icon() {
	icon="$(openweathercli --print icon)"

	case "$icon" in
	01d)
		echo "./images/weather/clear.png"
		;;
	01n)
		echo "./images/weather/clear-night.png"
		;;
	02d)
		echo "./images/weather/few-clouds.png"
		;;
	02n)
		echo "./images/weather/few-clouds-night.png"
		;;
	03d | 03n)
		echo "./images/weather/scattered-clouds.png"
		;;
	04d | 04n)
		echo "./images/weather/broken-clouds.png"
		;;
	09d | 09n | 10d | 10n)
		echo "./images/weather/rain.png"
		;;
	11d | 11n)
		echo "./images/weather/thunderstorm.png"
		;;
	13d | 13n)
		echo "./images/weather/snow.png"
		;;
	50d | 50n)
		echo "./images/weather/mist.png"
		;;
	esac
}

case "$1" in
-t | --temp) temp ;;
-i | --icon) icon ;;
esac
