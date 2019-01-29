#!/bin/bash

source ./inpcheck.bash
source ./quit.bash

edit(){
	DATE=$(date +"%x %r")
	CHECK=0
	clear
	echo "EDIT CONTACT"
	echo -n "Enter first name: "
	read FNAME
	echo -n "Enter middle name: "
	read MNAME
	echo -n "Enter last name: "
	read LNAME

	if [[ `cat contact.txt|cut -f1-3 -d:|grep -w "$FNAME:$MNAME:$LNAME"` ]]; then
		PLACE=$(cat contact.txt|grep "$FNAME:$MNAME:$LNAME"|cut -f4 -d:)
		ZIP=$(cat contact.txt|grep "$FNAME:$MNAME:$LNAME"|cut -f5 -d:)
		GENDER=$(cat contact.txt|grep "$FNAME:$MNAME:$LNAME"|cut -f6 -d:)
		NUM=$(cat contact.txt|grep "$FNAME:$MNAME:$LNAME"|cut -f7 -d:)
		MAIL=$(cat contact.txt|grep "$FNAME:$MNAME:$LNAME"|cut -f8 -d:)
		LINE=$(cat contact.txt|cut -f1-3 -d:|grep -wn "$FNAME:$MNAME:$LNAME"|cut -f1 -d:)
		CONTACT="$FNAME $MNAME $LNAME"	
	else
		clear
		echo "Name doesn't exist!"
		echo "Edit Failed, $FNAME $MNAME $LNAME doesn't exist">>logs.txt
		echo "Date and Time: $DATE">>logs.txt
		echo "**************************************************">>logs.txt
		echo " "
		quitpress
		exit 3
	fi 

	clear
	echo "$FNAME   $MNAME   $LNAME   $PLACE   $ZIP   $GENDER   $NUM   $MAIL"
	echo " __________________________________ "
	echo "|       CHOOSE WHAT TO EDIT        |"
	echo "|                                  |"
	echo "|       [1] FIRST NAME             |"
	echo "|       [2] MIDDLE NAME            |"
	echo "|       [3] LAST NAME              |"
	echo "|       [4] CITY/PROVINCE          |"
	echo "|       [5] ZIP CODE               |"
	echo "|       [6] GENDER                 |"
	echo "|       [7] CONTACT NUMBER         |"
	echo "|       [8] EMAIL ADDRESS          |"
	echo "|__________________________________|"

	read -s -n 1 CHOICE
	echo " "
	
	while ((CHECK<8)); do
		clear
		case "$CHOICE" in
				1)
					CHANGE="first name"
					echo -n "Enter new $CHANGE: "
					read FNAME
					;;
				2)
					CHANGE="middle name"
					echo -n "Enter new $CHANGE: "
					read MNAME
					;;	
				3)
					CHANGE="last name"
					echo -n "Enter new $CHANGE: "
					read LNAME
					;;
				4)
					CHANGE="city/province"
					echo -n "Enter new $CHANGE: "
					read PLACE
					;;
				5)
					CHANGE="zipcode"
					echo -n "Enter new $CHANGE: "
					read ZIP
					;;
				6)
					CHANGE="gender"
					echo -n "Enter new $CHANGE: "
					read GENDER 
					;;
				7)
					CHANGE="contact number"
					echo -n "Enter new $CHANGE: "
					read NUM
					;;
				8)
					CHANGE="email address"
					echo -n "Enter new $CHANGE: "
					read MAIL
					;;
				*)
					clear
					echo "Invalid choice"
					echo "Edit Failed, Invalid menu choice">>logs.txt
					echo "Date and Time: $DATE">>logs.txt
					echo "**************************************************">>logs.txt 
					echo " "
					quitpress
					exit 4
					;;
		esac
		inpcheck

	done

	if [[ $CHECK -eq 8 ]]; then
		sed "${LINE}d" contact.txt>temp.txt
		cat temp.txt>contact.txt
		echo "$FNAME:$MNAME:$LNAME:$PLACE:$ZIP:$GENDER:$NUM:$MAIL">>contact.txt
		echo "Contact edited successfully"
		echo "Successfully edited the $CHANGE of contact $CONTACT">>logs.txt
		echo "Date and Time: $DATE">>logs.txt
		echo "**************************************************">>logs.txt 
		rm temp.txt 
		echo " "
		quitpress
	else
		echo "Edit Failed, Invalid input values">>logs.txt
		echo "Date and Time: $DATE">>logs.txt 
		echo "**************************************************">>logs.txt
		echo " "
		echo quitpress
		exit 5
	fi
	
}

edit

exit
