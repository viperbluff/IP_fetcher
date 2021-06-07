#!/bin/sh

if [ "$1"  == "" ]; then
	echo "syntax: dig_bash.sh domain_file"

else
	cat $1 | unfurl domain | anew file_sorted.txt

	while read -r line; do	
		echo -e "Generating IP for $line\n"
		echo `dig $line | awk '{print $5 ; };'| grep -E '(([0-9]{1,3})\.){3}([0-9]{1,3}){1}'` >> final_ip.txt  
	done < "file_sorted.txt"
fi

