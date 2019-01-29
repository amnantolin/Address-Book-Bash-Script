#!/bin/bash

source ./quit.bash

deletecontact(){
	DATE=$(date +"%x %r")
	clear
	echo "DELETE CONTACT"
	echo -n "Enter first name: "
	read FNAME
	echo -n "Enter middle name: "
	read MNAME
	echo -n "Enter last name: "
	read LNAME
	
	if [[ `cat contact.txt|cut -f1-3 -d:|grep -w "$FNAME:$MNAME:$LNAME"` ]]; then
		clear
		cat contact.txt|grep -w "$FNAME:$MNAME:$LNAME"|tr : " "|column -t
		echo " "
		echo -n "Delete?(Y/N): "
		read CONF
		if [[ "$CONF" = "y" || "$CONF" = Y ]]; then
			LINE=$(cat contact.txt|cut -f1-3 -d:|grep -wn "$FNAME:$MNAME:$LNAME"|cut -f1 -d:)
			sed "${LINE}d" contact.txt>temp.txt
			cat temp.txt>contact.txt
			rm temp.txt
			clear
			echo "Contact $FNAME $MNAME $LNAME has been deleted"
			echo "$FNAME $MNAME $LNAME has been deleted from the contacts">>logs.txt
			echo "Date and Time: $DATE">>logs.txt
			echo "**************************************************">>logs.txt
			echo " "
			quitpress
		else
			exit
		fi
	else
		clear
		echo "Name doesn't exist!"
		echo "Deletion Failed, $FNAME $MNAME $LNAME doesn't exist">>logs.txt
		echo "Date and Time: $DATE">>logs.txt
		echo "**************************************************">>logs.txt
		echo " "
		quitpress
		exit 10 
	fi
}

deletecontact

exit
