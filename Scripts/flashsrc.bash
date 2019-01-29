#!/bin/bash

open(){
	clear
	figlet -w85 "     mori SOFT     "
	sleep 2 
	clear
	figlet -w85 "        E   B   A   C        " 
	sleep 1

	echo "                       LOADING"
	CNT=0
	while ((CNT<=53)); do
		echo -n "|"
		sleep 0.03 
		((CNT++))
	done

	clear
	figlet -w85 "        E   B   A   C        " 
	echo "                 OPENING APPLICATION"
	sleep 2 
	clear
}

close(){
	figlet -w85 "     THANKS     " 
	echo -n "          EXITING, PLEASE WAIT" 
	sleep 1
	
	COUNT=0
	while ((COUNT<=5));do
		echo -n " ."	 
		sleep 0.75 
		((COUNT++))
	done
	clear
}	
