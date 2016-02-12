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


    function findserver () {

dialog --title "Find Server" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--inputbox "Enter Server IP Address or Hostname " 8 30 2> find_ip_host.txt

response=$?
case $response in
   0) 
grep "`cat find_ip_host.txt`" show_shared_servers.sh show_mdservers.sh show_nodes.sh show_vps.sh >> /dev/null

if [ $? = 0 ]
then
grep  "`cat find_ip_host.txt`" show_shared_servers.sh show_mdservers.sh show_nodes.sh show_vps.sh | grep ssh | cut -d ";" -f2 > findserverresult.txt
sed -i 's/ssh//g' findserverresult.txt
ssh `cat findserverresult.txt`

else
dialog --title "Error" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "\n \n Server not found, Please enter a valid Hostname/IP Address." 10 60
fi ;;


 1) main_menu;;
 255) main_menu;;
             esac }
