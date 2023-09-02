#!/bin/bash

###################################################################################
#  This shell script uses 7z command to scan all the folder in current directory,
#  then zip the content in each folder and save as {folder name}.zip individually
#  The folder itself will not be zip
#
#  Made by Cyrus Chan on 2023/08/29
#  Modified on 2023/09/03 to support directories with space
###################################################################################

readarray -d '' directories < <(find . -type d -print0)
for directory in "${directories[@]:1}"
do
	file_name=$(echo $directory | cut -c 3-)
	file_name="${file_name}.zip"
	directory="${directory}/*"
	7z a "${file_name}" "${directory}"
	echo "${file_name} OK"
done