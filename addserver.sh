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


    function addserver () {

dialog --title "Add Server" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--inputbox "Enter Server IP Address " 8 30 2> add_ip.txt

dialog --title "Add Server" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--inputbox "Enter Server Hostname " 8 30 2> add_host.txt

dialog --title "Add Server" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--inputbox "Enter SSH Port number " 8 30 2> add_port.txt

dialog --title "Add Server" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--inputbox "Enter Server User Name " 8 30 2> add_user.txt

dialog --title "Add Server" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--inputbox "Enter Server Group Name. \n Available groups are : \n ( dedicated - vpsnodes - vps - sharedservers )" 12 40 2> add_group.txt


SERVERUSER=`cat add_user.txt`
SERVERHOST=`cat add_host.txt`
SERVERPORT=`cat add_port.txt`
SERVERIP=`cat add_ip.txt`
SERVERGROUP=`cat add_group.txt`

dialog --title "Confirm .?" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--yesno " Hostname   : `cat add_host.txt` \n IP Address : `cat add_ip.txt` \n SSH PORT   : `cat add_port.txt` \n User       : `cat add_user.txt` \n Group      : `cat add_group.txt`" 10 40

response=$?
case $response in
   0) 

if [ $SERVERGROUP = "dedicated" ]
 then
echo "Besm Allah"
sed -i "/Back to previous menu/ i$SERVERHOST \"$SERVERIP\" \\\\" show_mdservers.sh
sed -i "/Exit) echo/ i$SERVERHOST) clear ; ssh -p $SERVERPORT $SERVERUSER@$SERVERIP;;" show_mdservers.sh
ssh-copy-id -i ~/.ssh/id_rsa.pub "-p $SERVERPORT $SERVERUSER@$SERVERIP"
echo "$SERVERHOST:$SERVERIP:$SERVERUSER:$SERVERPORT:$SERVERGROUP" >> mdservers_list.txt
echo "$SERVERHOST:$SERVERIP:$SERVERUSER:$SERVERPORT:$SERVERGROUP" >> allservers_list.txt
echo "User : `whoami` Type : add server $SERVERHOST at `date`" >> logs/addserver.txt

dialog --title "Success" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Server $SERVERHOST added successfully, Please logoff for changes to take effect." 8 40



elif [ $SERVERGROUP = "vpsnodes" ]
 then
echo "Besm Allah"
sed -i "/Back to previous menu/ i$SERVERHOST \"$SERVERIP\" \\\\" show_nodes.sh
sed -i "/Exit) echo/ i$SERVERHOST) clear ; ssh -p $SERVERPORT $SERVERUSER@$SERVERIP;;" show_nodes.sh
ssh-copy-id -i ~/.ssh/id_rsa.pub "-p $SERVERPORT $SERVERUSER@$SERVERIP"
echo "$SERVERHOST:$SERVERIP:$SERVERUSER:$SERVERPORT:$SERVERGROUP"  >> vpsnodes_list.txt
echo "$SERVERHOST:$SERVERIP:$SERVERUSER:$SERVERPORT:$SERVERGROUP"  >> allservers_list.txt
echo "User : `whoami` Type : add server $SERVERHOST at `date`" >> logs/addserver.txt

dialog --title "Success" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Server $SERVERHOST added successfully, Please logoff for changes to take effect." 8 40



elif [ $SERVERGROUP = "vps" ]
 then
echo "Besm Allah"
sed -i "/Back to previous menu/ i$SERVERHOST \"$SERVERIP\" \\\\" show_vps.sh
sed -i "/Exit) echo/ i$SERVERHOST) clear ; ssh -p $SERVERPORT $SERVERUSER@$SERVERIP;;" show_vps.sh
ssh-copy-id -i ~/.ssh/id_rsa.pub "-p $SERVERPORT $SERVERUSER@$SERVERIP"
echo "$SERVERHOST:$SERVERIP:$SERVERUSER:$SERVERPORT:$SERVERGROUP"  >> vps_list.txt
echo "$SERVERHOST:$SERVERIP:$SERVERUSER:$SERVERPORT:$SERVERGROUP"  >> allservers_list.txt
echo "User : `whoami` Type : add server $SERVERHOST at `date`" >> logs/addserver.txt

dialog --title "Success" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Server $SERVERHOST added successfully, Please logoff for changes to take effect." 8 40



elif [ $SERVERGROUP = "sharedservers" ] 
 then
echo "Besm Allah"
sed -i "/Back to previous menu/ i$SERVERHOST \"$SERVERIP\" \\\\" show_shared_servers.sh
sed -i "/Exit) echo/ i$SERVERHOST) clear ; ssh -p $SERVERPORT $SERVERUSER@$SERVERIP;;" show_shared_servers.sh
ssh-copy-id -i ~/.ssh/id_rsa.pub "-p $SERVERPORT $SERVERUSER@$SERVERIP"
echo "$SERVERHOST:$SERVERIP:$SERVERUSER:$SERVERPORT:$SERVERGROUP"  >> sharedservers_list.txt
echo "$SERVERHOST:$SERVERIP:$SERVERUSER:$SERVERPORT:$SERVERGROUP"  >> allservers_list.txt
echo "User : `whoami` Type : add server $SERVERHOST at `date`" >> logs/addserver.txt

dialog --title "Success" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Server $SERVERHOST added successfully, Please logoff for changes to take effect." 8 40

  else
dialog --title "Error" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Please type a valid group \n Available groups are: \n ( dedicated - vpsnodes - vps - sharedservers )" 10 60
addserver
   fi 2>/dev/null ;;

 1) tools;;
 255) tools;;
             esac }
