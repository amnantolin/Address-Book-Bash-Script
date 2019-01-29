#!/bin/bash

quitpress(){
        echo "PRESS Q TO RETURN"

        while :; do
                read -s -n 1 ANS
                if [[ $ANS == 'q' || $ANS == 'Q' ]] ;then
                        break
                fi
        done
        clear
}
