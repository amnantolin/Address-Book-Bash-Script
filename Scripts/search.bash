#!/bin/bash

search(){
	if [[ `cat contact.txt|cut -f$SEL -d:|grep -woi "$KEY"` ]]; then
		MATCH=`cat contact.txt|grep -wi "$KEY"|tr " " "_"|tr : " "|column -t|tr "_" " "`
	else
		MATCH=`echo "No matches found in $TYPE"`
	fi	
}


CHOICE=1
KEY=""
TYPE=""
MATCH=""
clear
while [[ `echo "$CHOICE"|grep [1-8]` ]]; do
	echo " ________________________________________ "
	echo "|                                        |"
	echo "|    PRESS KEY TO SEARCH CONTACT LIST    |"
	echo "|                                        |"
	echo "|          [1] BY FIRST NAME             |"
	echo "|          [2] BY MIDDLE NAME            |"
	echo "|          [3] BY LAST NAME              |"
	echo "|          [4] BY CITY/PROVINCE          |"
	echo "|          [5] BY ZIP CODE               |"
	echo "|          [6] BY GENDER                 |"
	echo "|          [7] BY CONTACT NUMBER         |"
	echo "|          [8] BY EMAIL ADDRESS          |"
	echo "|                                        |"
	echo "|      PRESS ANY KEY TO EXIT SEARCH      |"       
	echo "|________________________________________|"
	echo " "
	echo "$MATCH"
	echo " " 
	read -s -n 1 SEL
	
	case $SEL in
			1)
				TYPE="First Name";;
			2)
				TYPE="Middle Name";;
			3) 
				TYPE="Last Name";;
			4)
				TYPE="City/Province";;
			5)
				TYPE="Zip Code";;
			6)
				TYPE="Gender";;
			7)
				TYPE="Contact Number";;
			8)
				TYPE="Email Address";;
			*)
				clear
				exit;;
	esac

	echo -n "Enter keyword for $TYPE (Exact Matching): "
	read KEY

	search
	clear

done

