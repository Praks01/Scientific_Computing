#! /bin/bash

awk '{ 
if ($1 >=200) 
	print "!!!!TEMP Exceeded UNFIT!!!!!!";
else
	print "Temperature:",$1;
}' Q2data.dat
