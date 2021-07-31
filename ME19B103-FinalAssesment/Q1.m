clear all
pkg load image

I=imread('/home/praks/notebook/Assignments/ME19B103-FinalAssesment/Flower.png');
GrayImg= rgb2gray(I);
colormap("gray");

Matrix = contour(GrayImg,1);        % Contour creation
title('Contour');
figure;
imshow(I)
title('RealPic');

Matrix(:,1)=[];
X = Matrix(1,:);                    % Storing sketch data points
Y = Matrix(2,:);

[r, c] = size(GrayImg);             % Shifting image to origin
l = size(X);
X = X - (c/2);
Y = Y - (r/2);

[theta,R] = cart2pol(X,Y);          % Converting to polar 
figure();
plot(theta,R,'.b')
title('theta vs R')
xlabel('Theta');
ylabel('Radial Distance');
hold on

petal = 8;                          % No of petals or Peaks

f = @(b,theta) b(1)+(b(2).*sin(petal.*theta))+(b(3).*cos(petal.*theta)); %Finding fit                          
B = fminsearch(@(b) norm(R - f(b,theta)), [100, 400, 400])                 
plot(theta, f(B,theta), '.g')
legend('Original','Fitted Model');
hold off

angle = linspace(0,2*pi,4297);
compR = B(1)+(B(2).*sin(petal.*angle))+(B(3).*cos(petal.*angle));

[xnew, ynew] = pol2cart(angle, compR);                            %Plotting Fit

figure;
plot(xnew, ynew)
title('Equation Plot');

