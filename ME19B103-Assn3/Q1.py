#! /usr/bin/env python

import numpy as np
import matplotlib.pyplot as plt             # Algorithm: Use bool to mark area occupied by circles.
                                            # Check for overlap with the bool values

def DrawCircle(x, y, x0, y0, radius, outside):
    r = np.sqrt((x - x0)**2 + (y - y0)**2)
    outside = outside*(r > radius)

    return outside


pixel = 1000
SquareSide = 100                            # Length of square side
pixelength = SquareSide/pixel
n=20                                         # number of circles
Radii = np.abs(10*np.random.randn(n))
radii = sorted(Radii, reverse=True)
print(radii)

x = np.linspace(0, SquareSide, pixel)
y = np.linspace(0, SquareSide, pixel)
x, y = np.meshgrid(x, y)

initialize = np.sqrt((x)**2 + (y)**2)
outside = initialize > -1

fig, ax = plt.subplots()
ax.set(xlabel='X', ylabel='Y', aspect=1.0)

outside = DrawCircle(x, y, radii[0], radii[0], radii[0], outside)    # First circle area bool
Xcursor = radii[0]
Ycursor = radii[0]
Yend = 2*radii[0]
i = 1

while i < len(radii):

    if((Xcursor+radii[i-1]+2*radii[i])<=SquareSide):
        Xcursor = Xcursor + radii[i-1] + radii[i]
        outside = DrawCircle(x, y, Xcursor, Ycursor, radii[i], outside)
        i = i+1
    else:
        Xcursor = radii[i]
        Ycursor = Yend + radii[i]
        Yend = Yend + 2*radii[i]
        outside = DrawCircle(x, y, Xcursor, Ycursor, radii[i], outside)

ax.scatter(x[outside], y[outside])
plt.show()

