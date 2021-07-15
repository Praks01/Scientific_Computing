#! /bin/bash

cd ~/Desktop/apache2
flag=0								#Flag to check for list.txt file
for files in `ls`
do
	if [ $files == "list.txt" ]
	then
		flag=1
		for bigfiles in `cat list.txt`
		do
			tar -zcf $bigfiles".tar.gz" $bigfiles	# Compress files specified in list
			rm $bigfiles				# Delete redundant uncompressed files
		done
	fi
done
if [ $flag -eq 0 ]
then
	echo "Please Run make list and then make small !!"	# list.txt file missing, show error
else
	echo "Compressed!!"					# Sucess output
fi

