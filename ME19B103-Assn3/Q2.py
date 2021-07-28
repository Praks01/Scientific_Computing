#!/usr/bin/env python

import matplotlib.pyplot as plt
import numpy as np

arr=np.arange(0,1000)		# Size of graph available to view

Temp=[77]			# Temp of replinished liquid
PouringTime=20			# Time taken to replenish
Trate=1				# Rate of Temp increase
MaxTemp=199			# max temp


time=len(arr)
i=0
 
while i<time:
  if Temp[i-1]==MaxTemp:
    Temp=Temp[:]+[77]*PouringTime
    i=i+PouringTime
    Temp[i]=77
    j = 0;
    while j<PouringTime:
    	print Temp[i]
	j = j+1
  else:
    T_new=Temp[i-1]+Trate
    Temp.append(T_new)
    print Temp[i]
    i=i+1

T_array=np.array(Temp[:len(arr)])

plt.plot(arr,T_array)

plt.show()

