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


     function viewlogs(){
              while true         
                        do

dialog --clear  --backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--title "[ViewLogs]" \
--cancel-label "Back" \
--menu "You can use the UP/DOWN arrow keys, Or the number keys 1-9 to choose an option.\n\
Choose the required option" 18 70 30 \
      Login_Logs "View users login" \
      Remove_Server_Logs "View removed servers login" \
      Add_Servers_logs "View added servers login" \
      Mexec_Logs "View Multi executions commands" \
      Exit "Back to previous menu" 2>"${INPUT}"

menuitem2=$(<"${INPUT}")
    case $menuitem2 in
	Login_Logs) dialog --title "Login logs" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "`cat logs/login.txt`" 18 70;;
	Remove_Server_Logs) dialog --title "Remove Servers logs" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "`cat logs/removeserver.txt`" 18 70;;
	Add_Servers_logs) dialog --title "Add Servers logs" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "`cat logs/addserver.txt`" 18 70;;
	Mexec_Logs) dialog --title "MExec logs" \
--backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--msgbox "`cat logs/mexec.txt`" 18 70;;
  	   *) echo "" ; echo "" ; break;;

    esac
                done
}
