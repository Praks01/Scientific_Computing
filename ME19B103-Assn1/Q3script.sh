#! /bin/bash

# Note: The folder does not contain apache2. Please make sure to put the apache2 folder in this directory before execution!!

for logfiles in `ls apache2`
do
	awk '{print substr($4,2,11), $1}' apache2/$logfiles | sort -u >> Q3.temp  # store date and Ip address in a temp file and sort
	
done

awk '{print $1}' Q3.temp | sort | uniq -c					  # Print count of unique Id and date
rm Q3.temp


