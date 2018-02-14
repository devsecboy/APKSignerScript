#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Enter the directory name as an arguement.. Ex. : ./debug.sh \$DIR_NAME\$"
	exit 1
fi

DirPath=$1
ApkPath=./$1'/dist/'$1'.apk'
SignedApk=./$1'/dist/'$1'.s.apk'
Destination=./$1'_signed.apk'
java -jar apktool b $DirPath
echo $ApkPath
java -jar sign.jar $ApkPath
echo $SignedApk
echo $Destination
mv $SignedApk $Destination
