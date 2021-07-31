#!/usr/bin/env python

import numpy as np

X = [1.1, 2.2, 3.3, 4.4, 5.5]
S = "Authentication code for this file is XzmBqr"
P = {"model":"Avrami", "n":4, "A":1.05, "system":"sample binary"}
Q = np.array([[1.1, 1.2, 1.3], [2.1, 2.2, 2.3],[3.1, 3.2, 3.3]])

f = open("mydata.dat", "w")
f.write("X = " + repr(X) + "\n" + "S = " + repr(S) + "\n" + "P = " +repr(P) + "\n" + "Q = " + repr(Q))
f.close()
