clc,clearvars,close All
% equation = input('Enter the equation (e.g., @(x) x^3 - 4*x^2 + 3*x - 7): ', 's');
eq = input('Enter an equation(for x): ','s');
f=str2func(['@(x) ', eq]);

fprintf('Enter the Interval: \n');
a = input('Enter the lower bound a: ');
b = input('Enter the upper bound b: ');
esp = input('Enter the tolarance: ' );
roots = [];

if f(a)*f(b)>=0
  fprintf('Error no roots in this interval\n');
  return
endif

n = 40;
it = 1;

for i=1:n

 c = (a*f(b) - b*f(a))/(f(b) - f(a));
 roots=[c,roots];

 if abs(a-c)<esp || abs(b-c)<esp
   break;
 endif



  if f(a)*f(c)<0
    b=c;
  elseif f(b)*f(c)<0
    a=c;
  end


end


fprintf('Root is %0.4f\n', c);
disp('Calculated roots in each iteration:');
disp(roots');


% Don't actually understand how to plot an equation without using . like y=x.^3
plot(roots);
