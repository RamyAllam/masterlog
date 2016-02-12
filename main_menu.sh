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


   function main_menu() {
      while true
         do

      dialog --backtitle "Master Log v1.0 --By : Ramy Allam. linux@ramyallam.com" \
      --title "[ Main Menu]" \
      --menu "You can use the UP/DOWN arrow keys, Or the number keys 1-9 to choose an option.\n\
        Choose the option" 18 70 8 \
            Dedicated_Servers "Managed Dedicated Servers" \
            Shared_Servers "Shared Hosting Servers" \
            VPS_Nodes "VPS Nodes" \
            VPS "Virtual Private Servers" \
            Find_Server "Find server within network" \
            MExec "Multi Commands Execution" \
            Tools "Network management tools" \
            Exit "Log out" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

#Select Option
      case $menuitem in
	  Dedicated_Servers) show_mdservers;;
	  Shared_Servers) show_shared_servers;;
	  VPS_Nodes) show_nodes;;
	  VPS) show_vps;;
	  Find_Server) findserver;;
	  MExec) mexec;;
	  Tools) tools;;
	  Exit) echo "" ; echo "" ;  break;;
  	  *) echo "" ; echo "" ; break;;
      esac  
    
      done
}
