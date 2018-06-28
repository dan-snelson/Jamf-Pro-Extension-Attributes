#!/bin/bash

############################################################
# Extension Attribute to determine Sophos' server location #
############################################################

testFile="/Library/Sophos Anti-Virus/SophosMcsAgentD.bundle/Contents/MacOS/SophosMcsAgentD"
if [[ -f "${testFile}" ]] ; then
	result="Cloud"
else
	result="On-prem"
fi

echo "<result>${result}</result>"

exit 0
