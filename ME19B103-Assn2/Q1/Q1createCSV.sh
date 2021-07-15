#! /bin/bash


for ((i=1; i<51; i+=1))
do
	quiz1=$(($RANDOM % 26))
	quiz2=$(($RANDOM % 26))
	endsem=$(($RANDOM % 51))
	total=$(($quiz1 + $quiz2 + $endsem))

	echo $i,$quiz1,$quiz2,$endsem,$total >> marks.csv
done

