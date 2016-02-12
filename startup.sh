#!/bin/bash
# Master Log v1.0
# Copyright 2012 Ramy Allam
# E-Mail : Linux@ramyallam.com
# Mobile : 002-01008740937
# Project URL : http://ramyallam.com/masterlog
# ===============================================
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
# ===============================================



#\\ Login process //
echo "User : `whoami` Type : login at `date`" >> logs/login.txt


# Get input 
INPUT=/tmp/network.sh.$$

### Display Master Login Main Menu ###
#
source ./main_menu.sh

########################################
#Display Managed Dedicated Servers
#
source ./show_shared_servers.sh

########################################
#Display Managed Dedicated Servers
#
source ./show_mdservers.sh

#########################################
#Display VPS Nodes
#
source ./show_nodes.sh

#########################################
#Display VPS Nodes
#
source ./show_vps.sh

#########################################
#Find Server withing network
#
source ./findserver.sh

#########################################

#Network Management Tools
#
source ./tools.sh

#########################################
# Add Server to network
#
source ./addserver.sh

#########################################
# Remove Server from network
#
source ./removeserver.sh
#########################################
# Remove Server from network
#
source ./mexec.sh
#########################################
# Remove Server from network
#
source ./viewlogs.sh
#########################################
# Mass Password Change
#
source ./passwordchange.sh
#########################################
# Mass Kernel Update
#
source ./kernelupdate.sh
#########################################
#Reset SSH Public Key
#
source ./resetpublickey.sh


## Start Script ##
main_menu


exit 0

