#!/bin/bash

################################################################################
# A script to determine the version of the DisplayLinkDriver Kernel Extension. #
# If DisplayLinkDriver is not installed, "Not Installed" will be returned.     #
################################################################################

RESULT="Not Installed"

testDirectory="/Library/Extensions/DisplayLinkDriver.kext" # DisplayLinkDriver KTEXT
if [ -d "${testDirectory}" ]; then # DisplayLinkDriver exists; read its version
	RESULT=$( /usr/bin/defaults read "/Library/Extensions/DisplayLinkDriver.kext/Contents/Info.plist" CFBundleVersion )
fi

echo "<result>$RESULT</result>"

exit 0
