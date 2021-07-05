#! /bin/bash

#Algorithm: To create log_file name with time stamp. Then check for other 
#	    files or logs with same name. If exists change its old name with new name
#           and quit. Else create a new file with log_file name.

flag=0;
filename=`date "+%Y%m%d-%H%M"`;
echo $filename."log";
for n in `ls`
do
	t=`file $n|grep $filename."log"`;
	if [ ! -z "$t" ]
	then
		echo "Re-naming pre-existing file";
		mv $n $filename."log";
		flag=1;
	fi
done

if [ $flag -eq 0 ]
then
	echo "creating new file";
	touch $filename."log"
fi

