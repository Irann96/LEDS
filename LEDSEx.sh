#!/bin/bash
LED_3=/sys/class/leds/beaglebone:green:usr3

function removeTrigger
{
	echo "none" >> "$LED_3/trigger"
}

echo "Led Script running"
if [ $# != 1 ]; then
	echo "Number of argument wrong"
	exit 2
fi

if [ "$1" == "on" ]; then
 	echo "LED3 on"
	removeTrigger
	echo "1" >> "$LED_3/brightness"

elif [ "$1" == "off" ]; then
	echo "LED3 off"
	removeTrigger
	echo "0" >> "$LED_3/brightness"

elif [ "$1" == "flash" ]; then
	echo "LED3 Flashing"
	removeTrigger
	echo "timer" >> "$LED_3/trigger"
	echo "150" >> "$LED_3/delay_on"
	echo "150" >> "$LED_3/delay_off"
fi
echo "Script Done"
