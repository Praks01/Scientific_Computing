clf;
A=10;

x=-0.5:0.1:0.5;
y=-0.5:0.1:0.5;
[X,Y]=meshgrid(x,y);

theta=atan(Y./X);
r=(X.^2+Y.^2).^0.5;
F = (-A.*cos(theta))./r;

[dFx, dFy] = gradient(F);

figure();
h = quiver(X,Y,dFx,dFy)
title("Quiver Plot")

