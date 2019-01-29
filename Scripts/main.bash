#!/bin/bash

source quit.bash
source flashsrc.bash
source backup.bash

open
clear
while [[ $CHOICE != 7 ]]; do
	back
	menu.bash
	read -s -n 1 CHOICE

	case "$CHOICE" in
		1)
			add.bash
			;;
		2)
			edit.bash	
			;;
		3)
			delete.bash	
			;;
		4)
			clear
			echo " _______________________ "
			echo "|                       |"
			echo "|       [1]VIEW         |"
			echo "|       [2]SORT         |"
			echo "|       [3]SEARCH       |"
			echo "|                       |"
			echo "|   PRESS ANY TO EXIT   |"
			echo "|_______________________|"
			read -s -n 1 ANS
			
			case "$ANS" in
				1)
					clear
					cat contact.txt|tr " " "_"|tr : " ">temps.txt
					echo "FN MN LN CITY/PROVINCE ZIP GENDER CONTACT_NO. EMAIL"|cat - temps.txt|column -t|tr "_" " "
					echo " "
					rm temps.txt
					quitpress
					;;
				2)
					sort.bash
					clear;;
				3)
					search.bash	
					clear;;
				*)
					clear
					continue;;
			esac
			;;
		5)
			clear
			batch.bash	
			;;
		6)
			clear
			logs.bash	
			;;
		7)
			clear
			close
			exit 
			;;
		*)
			clear
			echo "Invalid choice, try again"
			;;
	esac
done

exit	
	
