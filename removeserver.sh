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


    function removeserver () {

dialog --title "Remove Server" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--inputbox "Enter Server Hostname " 8 30 2> remove_host.txt

dialog --title "Remove Server" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--inputbox "Enter Server Group Name. \n Available groups are : \n ( dedicated - vpsnodes - vps - sharedservers )" 12 40 2> remove_group.txt


SERVERHOST=`cat remove_host.txt`
SERVERGROUP=`cat remove_group.txt`

dialog --title "Confirm delete .?" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--yesno " Hostname   : `cat remove_host.txt` \n Group      : `cat remove_group.txt`" 10 40

response=$?
case $response in
   0) 

if [ $SERVERGROUP = "dedicated" ]
 then
echo "Besm Allah"
sed -i "/$SERVERHOST.*/d" show_mdservers.sh
sed -i "/$SERVERHOST.*/d" mdservers_list.txt
sed -i "/$SERVERHOST.*/d" allservers_list.txt
dialog --title "Success" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Server $SERVERHOST removed successfully, Please logoff for changes to take effect." 8 40

elif [ $SERVERGROUP = "vpsnodes" ]
 then
echo "Besm Allah"
sed -i "/$SERVERHOST.*/d" show_nodes.sh
sed -i "/$SERVERHOST.*/d" vpsnodes_list.txt
sed -i "/$SERVERHOST.*/d" allservers_list.txt
echo "User : `whoami` Type : remove server $SERVERHOST at `date`" >> logs/removeserver.txt

dialog --title "Success" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Server $SERVERHOST removed successfully, Please logoff for changes to take effect." 8 40

elif [ $SERVERGROUP = "vps" ]
 then
sed -i "/$SERVERHOST.*/d" show_vps.sh
sed -i "/$SERVERHOST.*/d" vps_list.txt
sed -i "/$SERVERHOST.*/d" allservers_list.txt
echo "User : `whoami` Type : remove server $SERVERHOST at `date`" >> logs/removeserver.txt
dialog --title "Success" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Server $SERVERHOST removed successfully, Please logoff for changes to take effect." 8 40

elif [ $SERVERGROUP = "sharedservers" ] 
 then
sed -i "/$SERVERHOST.*/d" show_shared_servers.sh
sed -i "/$SERVERHOST.*/d" sharedservers_list.txt
sed -i "/$SERVERHOST.*/d" allservers_list.txt
echo "User : `whoami` Type : remove server $SERVERHOST at `date`" >> logs/removeserver.txt
dialog --title "Success" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Server $SERVERHOST removed successfully, Please logoff for changes to take effect." 8 40

  else
dialog --title "Error" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "Please type a valid group \n Available groups are: \n ( dedicated - vpsnodes - vps - sharedservers )" 10 60
removeserver
   fi 2>/dev/null ;;

 1) tools;;
 255) tools;;
             esac }
