#!/bin/bash

source ./tosort.bash

clear
OUT=`echo " ";
cat contact.txt|tr " " "_"|tr : " ">temps.txt;
echo "FN MN LN CITY/PROVINCE ZIP GENDER CONTACT_NO. EMAIL"|cat - temps.txt|column -t|tr "_" " ";
rm temps.txt`

CHOICE=a
while [[ `echo "$CHOICE"|grep [a-pA-P]` ]]; do
	echo " ____________________________________________________________________ "
	echo "|                                                                    |"
	echo "|                      PRESS KEY TO APPLY SORT                       |"
	echo "|                                                                    |"
	echo "|                                   ASCENDING        DESCENDING      |"
	echo "|                                                                    |"
	echo "|     BY FIRST NAME                    [a]               [i]         |"
	echo "|     BY MIDDLE NAME                   [b]               [j]         |"
	echo "|     BY LAST NAME                     [c]               [k]         |"
	echo "|     BY CITY/PROVINCE                 [d]               [l]         |"
	echo "|     BY ZIP CODE                      [e]               [m]         |"
	echo "|     BY GENDER                        [f]               [n]         |"
	echo "|     BY CONTACT NUMBER                [g]               [o]         |"
	echo "|     BY EMAIL ADDRESS                 [h]               [p]         |"
	echo "|                                                                    |"
	echo "|                     PRESS ANY KEY TO EXIT SORT                     |"
	echo "|____________________________________________________________________|"
	echo " "
	echo "$OUT"
	echo " "
	read -s -n 1 CHOICE

	case "$CHOICE" in
			[aA])
				SEL=1
				TYPE=1
				;;
			[bB])
				SEL=2
				TYPE=1
				;;
			[cC])
				SEL=3
				TYPE=1
				;;
			[dD])
				SEL=4
				TYPE=1
				;;
			[eE])
				SEL=5
				TYPE=1
				;;
			[fF])
				SEL=6
				TYPE=1
				;;
			[gG])
				SEL=7
				TYPE=1
				;;
			[hH])
				SEL=8
				TYPE=1
				;;
			[iI])
                      		SEL=1
	                        TYPE=2
       	  	              	;;
                	[jJ])
                        	SEL=2
                        	TYPE=2
                        	;;
                	[kK])
                        	SEL=3
                        	TYPE=2
                        	;;
                	[lL])
                        	SEL=4
                        	TYPE=2
                        	;;
                	[mM])
                        	SEL=5
                        	TYPE=2
                        	;;
                	[nN])
                        	SEL=6
                        	TYPE=2
                        	;;
                	[oO])
                        	SEL=7
                        	TYPE=2
                        	;;
                	[pP])
                        	SEL=8
                        	TYPE=2
                        	;;
			*)
				clear
				exit
				;;
	esac

	toSort
	OUT=`echo " ";
	echo ${ARR2[*]}|tr " " "\n"|tr : " ">temp1.txt;
	echo "FN MN LN CITY/PROVINCE ZIP GENDER CONTACT_NO. EMAIL"|cat - temp1.txt|column -t|tr "_" " ";
	rm temp1.txt`
	clear

done
 
exit
