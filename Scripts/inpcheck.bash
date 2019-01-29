#!/bin/bash

inpcheck(){
	clear
	CHECK=0
	echo " "
	if [[ `echo $FNAME|grep [0-9'!@#%*<>^$']` || -z "$FNAME" || `echo $FNAME|wc -w` -gt 2 ]]; then
		echo ">Invalid first name"
	else
		((CHECK++))
	fi

	if [[ `echo $MNAME|grep [0-9'!@#%*<>^$']` || -z "$MNAME" || `echo $MNAME|wc -w` -gt 2 ]]; then
		echo ">Invalid middle name"
	else
		((CHECK++))
	fi

	if [[ `echo $LNAME|grep [0-9'!@#%*<>^$']` || -z "$LNAME" || `echo $LNAME|wc -w` -gt 2 ]]; then
		echo ">Invalid last name"
	else
		((CHECK++))
	fi

	if [[ `echo $PLACE|grep [0-9'!@#%*<>^$']` || -z "$PLACE" || `echo $PLACE|wc -w` -gt 2 ]]; then
		echo ">Invalid city/province"
	else
		((CHECK++))
	fi
	
	if [[ `echo $ZIP|grep -v ^[0-9][0-9][0-9][0-9]$` || -z "$ZIP" ]]; then
		echo ">Invalid zip code format"
	else
		((CHECK++))
	fi

	if [[ `echo $GENDER|grep -v ^[mMfF]$` || -z "$GENDER" ]]; then
		echo ">Invalid gender" 
	else
		((CHECK++))
	fi

	if [[ `echo $NUM|grep -v ^09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$` || -z "$NUM" ]]; then
		echo ">Invalid contact number"
	else
		((CHECK++))
	fi

	if [[ `echo $MAIL|grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9._]+\.[A-Za-z]{2,15}\b"` || -z "$MAIL" ]]; then
		((CHECK++))
	else
		echo ">Invalid email address"
	fi

	if [[ CHECK -ne 8 ]]; then
		echo "PLEASE CHECK INPUT AND TRY AGAIN"
		echo " "
		echo "PRESS Q TO EXIT, OTHERWISE PRESS ANY KEY"
		read -s -n 1 INPCHOICE
		if [[ `echo $INPCHOICE|grep [qQ]` ]]; then
			clear
			exit
		fi
	fi
}

batchcheck(){
	clear
	CHECK=0

	FNAME_HIT=`cat 1|grep -v ^*[0-9'!@#%*<>^$']*$|wc -l`
	MNAME_HIT=`cat 2|grep -v ^*[0-9'!@#%*<>^$']*$|wc -l`
	LNAME_HIT=`cat 3|grep -v ^*[0-9'!@#%*<>^$']*$|wc -l` 
	PLACE_HIT=`cat 4|grep -v ^*[0-9'!@#%*<>^$']*$|wc -l` 
 	ZIP_HIT=`cat 5|grep ^[0-9][0-9][0-9][0-9]$|wc -l` 
	GENDER_HIT=`cat 6|grep ^[mMfF]$|wc -l` 
	NUM_HIT=`cat 7|grep ^09[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]$|wc -l` 
	MAIL_HIT=`cat 8|grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9._]+\.[A-Za-z]{2,15}\b"|wc -l`


	FNAME_CNT=`cat 1|wc -l`
	MNAME_CNT=`cat 2|wc -l`
	LNAME_CNT=`cat 3|wc -l`
	PLACE_CNT=`cat 4|wc -l`
	ZIP_CNT=`cat 5|wc -l`
	GENDER_CNT=`cat 6|wc -l`
	NUM_CNT=`cat 7|wc -l`
	MAIL_CNT=`cat 8|wc -l`


	if [[ $FNAME_HIT -eq $FNAME_CNT ]]; then
		((CHECK++))
	fi
	if [[ $MNAME_HIT -eq $MNAME_CNT ]]; then
		((CHECK++))
	fi
	if [[ $LNAME_HIT -eq $LNAME_CNT ]]; then
		((CHECK++))
	fi
	if [[ $PLACE_HIT -eq $PLACE_CNT ]]; then
		((CHECK++))
	fi
	if [[ $ZIP_HIT -eq $ZIP_CNT ]]; then
		((CHECK++))
	fi
	if [[ $GENDER_HIT -eq $GENDER_CNT ]]; then
		((CHECK++))
	fi
	if [[ $NUM_HIT -eq $NUM_CNT ]]; then
		((CHECK++))
	fi
	if [[ $MAIL_HIT -eq $MAIL_CNT ]]; then
		((CHECK++))
	fi

}
