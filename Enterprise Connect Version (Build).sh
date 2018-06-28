#!/bin/bash

#############################################################################
# Extension Attribute to determine the Enterprise Connect Version and Build #
#############################################################################

# Set Result to "Not Installed"
result="Not Installed"

# If the eccl binary is installed, return the version and build
if [[ -f "/Applications/Enterprise Connect.app/Contents/SharedSupport/eccl" ]] ; then
	result=$( /Applications/Enterprise\ Connect.app/Contents/SharedSupport/eccl -v | /usr/bin/sed 's/Version: //' )
fi

echo "<result>${result}</result>"

exit 0
