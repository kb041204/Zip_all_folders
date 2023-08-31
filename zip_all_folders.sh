#!/bin/bash

###################################################################################
#  This shell script uses 7z command to scan all the folder in current directory,
#  then zip the content in each folder and save as {folder name}.zip individually
#  The folder itself will not be zip
#
#  Made by Cyrus Chan on 2023/08/29
###################################################################################

directories=$(find . -type d)
delete="."

directories=( "${directories[@]/$delete}" )
for directory in $directories
do
	file_name=$(echo $directory | cut -c 3-)
	file_name="${file_name}.zip"
	directory="${directory}/*"
	7z a $file_name $directory
	echo "${file_name} OK"
done
