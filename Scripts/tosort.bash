#!/bin/bash

multiple(){
	if [[ `echo $SEL|grep [1-4]` ]]; then
		if [[ "${ARR[$j]}" = "${ARR[$((j+1))]}" ]]; then
        		ARR=(`cat contact.txt|cut -f$SEL -d:|cut -f2 -d" "`)
			ARR[$j]=`cat contact.txt|cut -f$SEL -d:|grep -w "${ARR[$j]}"|cut -f2 -d" "` 
			ARR[$((j+1))]=`cat contact.txt|cut -f$SEL -d:|grep -w "${ARR[$((j+1))]}"|cut -f2 -d" "` 
		fi
	fi
}

toSort(){
	if [ $SEL -eq 8 ]; then
		ARR=(`cat contact.txt|cut -f$SEL -d:|cut -f1 -d"@"`)
	else
        	ARR=(`cat contact.txt|cut -f$SEL -d:|cut -f1 -d" "`)
	fi

        ARR2=(`cat contact.txt|tr " " "_"`)
        LEN=${#ARR[*]}

        for(( i=0; i<LEN; i++ ));do
                for (( j=0; j<LEN-i-1; j++ ));do
			BAK1=${ARR[j]}
			BAK2=${ARR[$((j+1))]}

                        if [[ "$TYPE" -eq 1 ]]; then
				#multiple
	                        if [[ "${ARR[j]}" > "${ARR[$((j+1))]}" ]]; then
					ARR[$j]=$BAK1
					ARR[$((j+1))]=$BAK2		

       		                        TEMP=${ARR[$j]}
                   	                ARR[$j]=${ARR[$((j+1))]}
                       	                ARR[$((j+1))]=$TEMP

                                        TEMP2=${ARR2[$j]}
                                        ARR2[$j]=${ARR2[$((j+1))]}
                                        ARR2[$((j+1))]=$TEMP2
                                fi

                        elif [[ "$TYPE" -eq 2 ]]; then
				#multiple
				if [[ "${ARR[j]}" < "${ARR[$((j+1))]}" ]]; then
					ARR[$j]=$BAK1
					ARR[$((j+1))]=$BAK2	
	
                                        TEMP=${ARR[$j]}
                                        ARR[$j]=${ARR[$((j+1))]}
                                        ARR[$((j+1))]=$TEMP

                                        TEMP2=${ARR2[$j]}
                                        ARR2[$j]=${ARR2[$((j+1))]}
                                        ARR2[$((j+1))]=$TEMP2
                                fi
                        else
                                exit
                        fi
			
                done
        done
}
