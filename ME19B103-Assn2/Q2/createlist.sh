#! /bin/bash

echo "Enter file size threshold(k-kb;M-Mb;G-Gb):";	# Obtain threshold from user
read MODSIZE;

cd ~/Desktop/apache2

find . -maxdepth 1 -size +$MODSIZE >> list.txt		#Store large size files in list.txt

cat list.txt

 
