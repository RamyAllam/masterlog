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

     function tools(){
              while true         
                        do

dialog --clear  --backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
--title "[Tools]" \
--cancel-label "Back" \
--menu "You can use the UP/DOWN arrow keys, Or the number keys 1-9 to choose an option.\n\
Choose the required option" 18 70 30 \
      Add_Server "Add servers to network" \
      Remove_Server "Remove servers from network" \
      View_Logs "View network logs" \
      Servers_Password "Change all servers passwords" \
      Kernel_update "Update kernel on all servers" \
      Reset_PublicKey "Reset SSH fingerprints" \
      Exit "Back to previous menu" 2>"${INPUT}"

menuitem2=$(<"${INPUT}")
    case $menuitem2 in
	Add_Server) addserver;;
	Remove_Server) removeserver;;
	View_Logs) viewlogs;;
	Servers_Password) passwordchange;;
	Kernel_update) kernelupdate;;
        Reset_PublicKey) resetpublickey;;
	Exit) echo "" ; echo "" ; break;;
  	   *) echo "" ; echo "" ; break;;

    esac
                done
}
