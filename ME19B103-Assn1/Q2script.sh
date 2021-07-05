#! /bin/bash

#Algorithm: Search every folders and identify the image type
#           Compare extension and type, rename and log if different

flag=0;				                                                     #Flag to indicate if any change has been done 

for part in `ls figs`
do

	for subpart in `ls figs/$part`
	do

		for image in `ls figs/$part/$subpart`
		do

		FileType=$(file -b figs/$part/$subpart/$image | sed -n 's/ .*//p')    #Obtain filetype
		FileExtension=$(echo $image | sed -n 's/.*\.//p')	     	      #Obtain Input Extension
		Filename=$(echo $image | sed -n 's/\..*//p')			      #Obtain Input FileName
		if [ "$FileType" != "$FileExtension" ]			              #Compare FileType with extension
		then

		if [ "$FileType" == "PC" ] && [ "$FileExtension" != "BMP" ]           #Additional if to check bmp type 
		then
	
		mv figs/$part/$subpart/$image figs/$part/$subpart/$Filename".BMP"     #Rename
		echo $Filename"."$FileExtension" Renamed to "$Filename".BMP" >> q2log.txt #Log
		flag=1;

		elif [ "$FileExtension" != "BMP" ]
		then
		mv figs/$part/$subpart/$image figs/$part/$subpart/$Filename"."$FileType
		echo $Filename"."$FileExtension" Renamed to "$Filename"."$FileType >> q2log.txt
		flag=1;
		fi
		fi
		done
	done
done

echo `date "+%Y%m%d-%H%M"` >> q2log.txt	                          #TimeStamp to log date and time

if [ $flag -eq 0 ]
then
	echo "Checked! All extensions are correct" >> q2log.txt
else
	echo "Updated correct extensions" >> q2log.txt
fi
cat q2log.txt
echo "Run again to Check!"					  #We can check by running the same code again!
