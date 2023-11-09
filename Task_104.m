clc;
pkg load symbolic;

eq = input('Enter an equation(in terms of x): ', 's');
a = input('Enter the lower bound a: ');
b = input('Enter the upper bound b: ');
f = str2func(['@(x) ', eq]);
syms x;
ff = diff(f(x), x);
g = matlabFunction(ff);
esp = input('Enter tolerance: ');
n=40
results = [];

if f(a)*f(b)>=0
  fprintf('Error no roots in this interval\n');
  return
endif

c = (a+b)/2;


for i = 1:n
  fc = f(c);
  gc = g(c);
  results = [c, results];
  cnext = c - (fc/gc);
  if abs(d-c) <= esp
    break;
  endif
  c = cnext;
  d=c;
  plot(d,f(d),'*');
end

fprintf('Root is %0.4f\n', c);
disp('Calculated roots in each iteration:');
disp(results');
x = 0:0.1:10;
hold on;
plot(x, f(x));
plot(c, f(c), 'xr');
title([eq, ' = 0']);
titleFontSize = 16;
set(get(gca, 'title'), 'FontSize', titleFontSize);
xlabel('X');
ylabel('Y');
axisLabelFontSize = 12;
set(gca, 'FontSize', axisLabelFontSize);
set(gca, 'xAxisLocation', 'origin');
legend('Function values ', 'Root');


