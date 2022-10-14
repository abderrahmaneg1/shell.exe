#!/bin/bash


for (( nb=2 ; nb!=14 ; nb++ ))
do
        role=$(head -n $nb Shell_userlist.csv | tail -n 1 | cut -d , -f 5)
        user=$(head -n $nb Shell_userlist.csv | tail -n 1 | cut -d , -f 2 | sed 's/ //g')-$(head -n $nb Shell_userlist.csv | tail -n 1 | cut -d , -f 3 | sed 's/ //g')
	password=$(head -n $nb Shell_userlist.csv | tail -n 1 | cut -d , -f 4)

        sudo useradd $user -p -d  $password
	

        if [[ "$role" == *Admin* ]]; then
                sudo usermod -aG sudo $user 
                echo "$user $role"
        fi

done
