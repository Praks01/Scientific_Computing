#! /bin/bash


awk 'BEGIN{FS=","; maxmark=0;}{
	if( $5 > maxmark){ maxmark = $5}}
	END{print maxmark}' marks.csv > maxmark.txt
for i in `cat maxmark.txt` 
do
	 awk 'BEGIN{FS=",";print "RollNo","TotalMarks","NormalMarks","Grade"}{
		norm=(100*$5/topmark);
		if (norm > 90) g="S";
		else if (norm > 80) g="A";
		else if (norm > 70) g="B";
		else if (norm > 60) g="C";
		else if (norm > 50) g="D";
		else if (norm > 40) g="E";
		else g="U"; 
		print $1,$5,norm,g}' topmark=$i marks.csv >> Grades.csv
done
rm maxmark.txt
cat Grades.csv
