clear all
pkg load image

I=imread('/home/praks/notebook/Assignments/ME19B103-Assn5/Dhoni.jpeg');

J=rot90(rot90(I));                    % Rotate 180 deg

GrayImg= rgb2gray(J);                 % Cnvrt to gray
[r, c]=size(GrayImg);
figure;

colormap("gray");

[C, m] = contour(GrayImg,3);          
title("PencilSketch-MS Dhoni")

matrix=get(m(1),'contourmatrix');      % Obtain contour Matrix

figure;
colormap("gray");
scatter(matrix(1,:),matrix(2,:),'.');   % Replot
title("PencilSketch-Replot")

h=gca;
set(h,'ylim',[0, 165]);
set(h,'xlim',[0, 305]);





