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


    function passwordchange () {
source ./mass_pass_func.sh
dialog --title "Warning" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "\n \n You should have cPanel installed on your server to use this option." 10 60

dialog --title "Mass Password Change" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--inputbox "Enter Server Group Name. \n Available groups are : \n ( dedicated - vpsnodes - vps - sharedservers ) \n Type ( all ) to execute commands on all servers." 12 40 2> pass_change_group.txt

SERVERGROUP=`cat pass_change_group.txt`
response=$?
case $response in
   0) 

dialog --clear  --backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--title "[Mass Password Change]" \
--cancel-label "Back" \
--menu "You can use the UP/DOWN arrow keys, Or the number keys 1-9 to choose an option.\n\
Choose the required option" 18 70 30 \
Random "Generate random passwords" \
Manual "Enter required password" \
      Exit "Back to previous menu" 2>"${INPUT}"

menuitem3=$(<"${INPUT}")
    case $menuitem3 in
Random) random_mass_passwords ;;  

Manual) manual_mass_passwords ;;

	Exit) echo "" ; echo "" ; break;;
  	   *) echo "" ; echo "" ; break;;

    esac ;; 


 1) tools;;
 255) tools;;
             esac }
