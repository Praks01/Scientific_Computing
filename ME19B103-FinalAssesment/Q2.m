clear all
x = linspace(0, 5, 50);
A = [20, 20, 3];                                  %Constants of function 
Error = 0.1                                      %Error percentage 

g = A(1) + A(2)*exp(-A(3).*x);                    %Clean Function
plot(x, g)

hold ON

amplitude = Error*max(g);
h = g + amplitude.*rand(size(x));                 %Function with error
plot(x, h)

f = @(b,x) b(1)+b(2).*exp(b(3).*x);               %Finding fit                          
B = fminsearch(@(b) norm(h - f(b,x)), [30, 30, 2]);                  
plot(x, f(B,x), '-g')
hold off

grid
xlabel('x')
ylabel('Value')
legend('TheoryCurve','PracticalCurve','FitCurve')

CoeffError = A - B                                %Difference in coeff