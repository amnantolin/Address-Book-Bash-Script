#!/bin/bash
source ./inpcheck.bash
source ./quit.bash

loadbatch(){
	DATE=$(date +"%x %r")
	CHECK=0
	clear
	echo "LOAD CONTACTS VIA BATCH FILE"
	echo -n "Enter file location: "
	read LOC

	if [[ `cat $LOC` ]]; then
		if [[ `cat $LOC` != *:*:*:*:*:*:*:* ]]; then
			clear
			echo "Invalid format"
			echo "Adding Batch File Failed, invalid format">>logs.txt
			echo "Date and Time: $DATE">>logs.txt
			echo "**************************************************">>logs.txt
			echo " "
			quitpress
			exit 6	
		elif [[ `cat contact.txt $LOC|cut -f1-3 -d:|sort|uniq -cd` ]]; then
			clear
			echo "Content/s of $LOC already exist in contacts"
			echo "Adding Batch File Failed, duplicate contents in $LOC">>logs.txt
			echo "Date and Time: $DATE">>logs.txt
			echo "**************************************************">>logs.txt
			echo " "
			quitpress	
			exit 7	
		fi

		checkcontent
		if [[ $CHECK -eq 8 ]] ; then
			cat $LOC>>contact.txt
			clear
			echo "Contents of batch file has been added to contacts"
			echo "Successfully added contents of $LOC to contacts">>logs.txt
			echo "Date and Time: $DATE">>logs.txt
			echo "**************************************************">>logs.txt
			echo " "
			quitpress
		else
			echo "$LOC contains invalid input values"
			echo "Adding Batch File Failed, invalid input values">>logs.txt
			echo "Date and Time: $DATE">>logs.txt
			echo "**************************************************">>logs.txt
			echo " "
			quitpress
			exit 8
		fi
	else
		clear
		echo "$LOC doesn't exists"
		echo "Adding Batch File Failed, $LOC doesn't exists">>logs.txt	
		echo "Date and Time: $DATE">>logs.txt
		echo "**************************************************">>logs.txt
		echo " "
		quitpress
		exit 9
	fi		 	

}

checkcontent(){
	cat $LOC|cut -f1 -d:>1
	cat $LOC|cut -f2 -d:>2
	cat $LOC|cut -f3 -d:>3
	cat $LOC|cut -f4 -d:>4
	cat $LOC|cut -f5 -d:>5
	cat $LOC|cut -f6 -d:>6
	cat $LOC|cut -f7 -d:>7
	cat $LOC|cut -f8 -d:>8

	batchcheck

	rm 1 2 3 4 5 6 7 8
}

loadbatch


exit
