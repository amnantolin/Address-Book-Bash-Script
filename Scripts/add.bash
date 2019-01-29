#!/bin/bash

source ./inpcheck.bash
source ./quit.bash

addcontact(){
	clear
	END=""
	DATE=$(date +"%x %r")
	CHECK=0
	echo "ADD CONTACT"
	
	while (($CHECK<8)) ; do
		echo -n "Enter first name(max 2 words): "
		read FNAME
		echo -n "Enter middle name(max 2 words): "
		read MNAME
		echo -n "Enter last name(max 2 words): "
		read LNAME
		echo -n "Enter city/province(max 2 words): "
		read PLACE
		echo -n "Enter zipcode(####): "
		read ZIP
		echo -n "Enter gender(M/F): "
		read GENDER
		echo -n "Enter contact number(09#########): "
		read NUM
		echo -n "Enter email address(ex:a@a.ph): "
		read MAIL
		
		inpcheck
	done

	if [[ `cat contact.txt|cut -f1-3 -d:|grep -w "$FNAME:$MNAME:$LNAME"` ]]; then
		clear
		echo "Name already exist in the contacts"
		echo "Adding Failed, $FNAME $MNAME $LNAME already exist">>logs.txt
		echo "Date and Time: $DATE">>logs.txt
		echo "**************************************************">>logs.txt
		echo " "
		quitpress
		exit 2
	else
		clear
		echo "$FNAME:$MNAME:$LNAME:$PLACE:$ZIP:$GENDER:$NUM:$MAIL">>contact.txt
		echo "Contact has been successfully added to the list"
		echo "$FNAME $MNAME $LNAME successfully added to the contacts">>logs.txt
		echo "Date and Time: $DATE">>logs.txt
		echo "**************************************************">>logs.txt
		echo " "
		quitpress
	fi
}

addcontact

exit
