#!/bin/bash
# Master Log v1.0
# Copyright 2012 Ramy Allam
# E-Mail : Linux@ramyallam.com
# Mobile : 002-01008740937
# Project URL : http://ramyallam.com/masterlog
# ===============================================
#   This file is part of Master Log.
#
#   Master Log is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   Master Log is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with Master Log.  If not, see <http://www.gnu.org/licenses/>.
# ===============================================


function random_mass_passwords () {
source ./passwordchange.sh

if [ $SERVERGROUP = "dedicated" ]
 then
for i in `cat mdservers_list.txt`
do
FINDHOSTNAME=`echo $i | cut -d ":" -f1`
FINDHOSTIP=`echo $i | cut -d ":" -f2`
FINDHOSTPORT=`echo $i | cut -d ":" -f4`
FINDHOSTUSER=`echo $i | cut -d ":" -f3`
echo "User : `whoami` Type : Mass_Password_Change on ( dedicated servers group - $FINDHOSTNAME ) at `date`" >> logs/mexec.txt
echo "Executing Mass Password Change on $FINDHOSTNAME"
sleep 1
ssh -p $FINDHOSTPORT $FINDHOSTUSER@$FINDHOSTIP /scripts/chpass root `date +%s | sha256sum | base64 | head -c 32 ; echo`
echo "######################################################"
done

elif [ $SERVERGROUP = "vpsnodes" ]
 then
for i in `cat vpsnodes_list.txt`
do
FINDHOSTNAME=`echo $i | cut -d ":" -f1`
FINDHOSTIP=`echo $i | cut -d ":" -f2`
FINDHOSTPORT=`echo $i | cut -d ":" -f4`
FINDHOSTUSER=`echo $i | cut -d ":" -f3`
echo "User : `whoami` Type : Mass_Password_Change on ( vps nodes group - $FINDHOSTNAME ) at `date`" >> logs/mexec.txt
echo "Executing Mass Password Change on $FINDHOSTNAME"
sleep 1
ssh -p $FINDHOSTPORT $FINDHOSTUSER@$FINDHOSTIP /scripts/chpass root `date +%s | sha256sum | base64 | head -c 32 ; echo`
echo "######################################################"
done

elif [ $SERVERGROUP = "vps" ]
 then
for i in `cat vps_list.txt`
do
FINDHOSTNAME=`echo $i | cut -d ":" -f1`
FINDHOSTIP=`echo $i | cut -d ":" -f2`
FINDHOSTPORT=`echo $i | cut -d ":" -f4`
FINDHOSTUSER=`echo $i | cut -d ":" -f3`
echo "User : `whoami` Type : Mass_Password_Change on ( vps group - $FINDHOSTNAME ) at `date`" >> logs/mexec.txt
echo "Executing Mass Password Change on $FINDHOSTNAME"
sleep 1
ssh -p $FINDHOSTPORT $FINDHOSTUSER@$FINDHOSTIP /scripts/chpass root `date +%s | sha256sum | base64 | head -c 32 ; echo`
echo "######################################################"
done


elif [ $SERVERGROUP = "sharedservers" ] 
 then
for i in `cat sharedservers_list.txt`
do
FINDHOSTNAME=`echo $i | cut -d ":" -f1`
FINDHOSTIP=`echo $i | cut -d ":" -f2`
FINDHOSTPORT=`echo $i | cut -d ":" -f4`
FINDHOSTUSER=`echo $i | cut -d ":" -f3`
echo "User : `whoami` Type : Mass_Password_Change on ( shared servers group - $FINDHOSTNAME ) at `date`" >> logs/mexec.txt
echo "Executing Mass Password Change on $FINDHOSTNAME"
sleep 1
ssh -p $FINDHOSTPORT $FINDHOSTUSER@$FINDHOSTIP /scripts/chpass root `date +%s | sha256sum | base64 | head -c 32 ; echo`
echo "######################################################"
done

elif [ $SERVERGROUP = "all" ] 
 then
for i in `cat allservers_list.txt`
do
FINDHOSTNAME=`echo $i | cut -d ":" -f1`
FINDHOSTIP=`echo $i | cut -d ":" -f2`
FINDHOSTPORT=`echo $i | cut -d ":" -f4`
FINDHOSTUSER=`echo $i | cut -d ":" -f3`
echo "User : `whoami` Type : Mass_Password_Change on ( all servers group - $FINDHOSTNAME ) at `date`" >> logs/mexec.txt
echo "Executing Mass Password Change on $FINDHOSTNAME"
sleep 1
ssh -p $FINDHOSTPORT $FINDHOSTUSER@$FINDHOSTIP /scripts/chpass root `date +%s | sha256sum | base64 | head -c 32 ; echo`
echo "######################################################"
done

  else
dialog --title "Error" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Please type a valid group \n Available groups are: \n ( dedicated - vpsnodes - vps - sharedservers )" 10 60
tools
   fi 2>/dev/null 
}




function manual_mass_passwords () {
source ./passwordchange.sh
if [ $SERVERGROUP = "dedicated" ]
 then
echo -n "Please enter the required password : "
read masspassword
for i in `cat mdservers_list.txt`
do
FINDHOSTNAME=`echo $i | cut -d ":" -f1`
FINDHOSTIP=`echo $i | cut -d ":" -f2`
FINDHOSTPORT=`echo $i | cut -d ":" -f4`
FINDHOSTUSER=`echo $i | cut -d ":" -f3`
echo "User : `whoami` Type : Mass_Password_Change on ( dedicated servers group - $FINDHOSTNAME ) at `date`" >> logs/mexec.txt
echo "Executing Mass Password Change on $FINDHOSTNAME"
sleep 1
ssh -p $FINDHOSTPORT $FINDHOSTUSER@$FINDHOSTIP /scripts/chpass root `echo $masspassword`
echo "######################################################"
done

elif [ $SERVERGROUP = "vpsnodes" ]
 then
echo -n "Please enter the required password : "
read masspassword
for i in `cat vpsnodes_list.txt`
do
FINDHOSTNAME=`echo $i | cut -d ":" -f1`
FINDHOSTIP=`echo $i | cut -d ":" -f2`
FINDHOSTPORT=`echo $i | cut -d ":" -f4`
FINDHOSTUSER=`echo $i | cut -d ":" -f3`
echo "User : `whoami` Type : Mass_Password_Change on ( vps nodes group - $FINDHOSTNAME ) at `date`" >> logs/mexec.txt
echo "Executing Mass Password Change on $FINDHOSTNAME"
sleep 1
ssh -p $FINDHOSTPORT $FINDHOSTUSER@$FINDHOSTIP /scripts/chpass root `echo $masspassword`
echo "######################################################"
done

elif [ $SERVERGROUP = "vps" ]
 then
echo -n "Please enter the required password : "
read masspassword
for i in `cat vps_list.txt`
do
FINDHOSTNAME=`echo $i | cut -d ":" -f1`
FINDHOSTIP=`echo $i | cut -d ":" -f2`
FINDHOSTPORT=`echo $i | cut -d ":" -f4`
FINDHOSTUSER=`echo $i | cut -d ":" -f3`
echo "User : `whoami` Type : Mass_Password_Change on ( vps group - $FINDHOSTNAME ) at `date`" >> logs/mexec.txt
echo "Executing Mass Password Change on $FINDHOSTNAME"
sleep 1
ssh -p $FINDHOSTPORT $FINDHOSTUSER@$FINDHOSTIP /scripts/chpass root `echo $masspassword`
echo "######################################################"
done


elif [ $SERVERGROUP = "sharedservers" ] 
 then
echo -n "Please enter the required password : "
read masspassword
for i in `cat sharedservers_list.txt`
do
FINDHOSTNAME=`echo $i | cut -d ":" -f1`
FINDHOSTIP=`echo $i | cut -d ":" -f2`
FINDHOSTPORT=`echo $i | cut -d ":" -f4`
FINDHOSTUSER=`echo $i | cut -d ":" -f3`
echo "User : `whoami` Type : Mass_Password_Change on ( shared servers group - $FINDHOSTNAME ) at `date`" >> logs/mexec.txt
echo "Executing Mass Password Change on $FINDHOSTNAME"
sleep 1
ssh -p $FINDHOSTPORT $FINDHOSTUSER@$FINDHOSTIP /scripts/chpass root `echo $masspassword`
echo "######################################################"
done

elif [ $SERVERGROUP = "all" ] 
 then
echo -n "Please enter the required password : "
read masspassword
for i in `cat allservers_list.txt`
do
FINDHOSTNAME=`echo $i | cut -d ":" -f1`
FINDHOSTIP=`echo $i | cut -d ":" -f2`
FINDHOSTPORT=`echo $i | cut -d ":" -f4`
FINDHOSTUSER=`echo $i | cut -d ":" -f3`
echo "User : `whoami` Type : Mass_Password_Change on ( all servers group - $FINDHOSTNAME ) at `date`" >> logs/mexec.txt
echo "Executing Mass Password Change on $FINDHOSTNAME"
sleep 1
ssh -p $FINDHOSTPORT $FINDHOSTUSER@$FINDHOSTIP /scripts/chpass root `echo $masspassword`
echo "######################################################"
done

  else
dialog --title "Error" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Please type a valid group \n Available groups are: \n ( dedicated - vpsnodes - vps - sharedservers )" 10 60
tools
   fi 2>/dev/null 
}
