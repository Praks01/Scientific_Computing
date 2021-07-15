#! /bin/bash

cd ~/Desktop/apache2
flag=0							#Flag to check for list.txt file

for files in `ls`
do
	if [ $files == "list.txt" ]
	then
		flag=1
		for bigfiles in `cat list.txt`
		do
			tar -xf $bigfiles".tar.gz"	# UnCompress files specified in list
			rm $bigfiles".tar.gz"		# Remove redundant compressed files
		done
	fi
done
if [ $flag -eq 0 ]
then
	echo "List Missing!! Cannot Proceed!!!"         # list.txt file missing, show error
else
	echo "Restored!!"				# Sucess output		
	rm list.txt							
fi

