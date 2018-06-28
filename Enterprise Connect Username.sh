#!/bin/bash

############################################################################
# Extension Attribute to determine the user logged into Enterprise Connect #
############################################################################

# Get the logged-in user's username
loggedInUser=$( /usr/bin/stat -f %Su "/dev/console" )

if [[ ${loggedInUser} == "root" ]] || [[ ${loggedInUser} == "adobeinstall" ]] || [[ ${loggedInUser} == "_mbsetupuser" ]] ; then

	result="${loggedInUser}"

else

	if [[ -f "/Applications/Enterprise Connect.app/Contents/SharedSupport/eccl" ]] ; then

		adUsername=$( /usr/bin/su \- "${loggedInUser}" -c "/Applications/Enterprise\ Connect.app/Contents/SharedSupport/eccl -p adUsername" | /usr/bin/sed 's/adUsername: //' )

		if [[ ${adUsername} == "missing value" ]]; then	# Enterprise Connect installed, but user is NOT logged in

			result="${loggedInUser} NOT logged into Enterprise Connect"

		else	# Enterprise Connect installed and the user is logged in

			result="${adUsername}"

		fi

	else

		result="${loggedInUser} NOT logged into Enterprise Connect; eccl missing"

	fi

fi

echo "<result>${result}</result>"

exit 0
