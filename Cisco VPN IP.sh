#!/bin/bash

###########################################################################
# Extension Attribute to read the IP address of the active VPN connection #
###########################################################################

RESULT="Not Installed"

testFile="/opt/cisco/anyconnect/bin/vpn" # Cisco VPN binary

if [[ -f "${testFile}" ]] ; then
	# Cisco AnyConnect installed; read current IP Address
	RESULT=$( /opt/cisco/anyconnect/bin/vpn stats | /usr/bin/grep "Client Address (IPv4):" | /usr/bin/awk '{print $4}' )

	if [[ "${RESULT}" == "" ]]; then
		RESULT="No VPN Connection"
	fi

fi

echo "<result>$RESULT</result>"

exit 0
