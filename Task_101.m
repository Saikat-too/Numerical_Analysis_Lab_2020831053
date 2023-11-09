% Input equation as a string
equation_str = input('Enter the equation (e.g., ''x^3 - 4*x^2 + 3*x - 7''): ', 's');
f = str2func(['@(x) ', equation_str]);

% Input interval [a, b]
a = input('Enter the lower bound a: ');
b = input('Enter the upper bound b: ');

% Input tolerance
tolerance = input('Enter the tolerance for stopping: ');

% Initialize variables
roots = [];
iterations = 0;

% Bisection method
while (b - a) >= tolerance
    c = (a + b) / 2;
    fa = f(a);
    fb = f(b);
    fc = f(c);

    % Store the root for this iteration
    roots = [roots; c];

    if fa * fc < 0
        b = c;
    else
        a = c;
    end

    iterations = iterations + 1;
end

% Display the root and number of iterations
disp(['Root found: ', num2str(c)]);
disp(['Number of iterations: ', num2str(iterations)]);

% Plot the equation and roots
x = linspace(a, b, 1000);
y = f(x);

figure;
plot(x, y, 'b-', 'LineWidth', 2);
hold on;
scatter(roots, zeros(size(roots)), 'ro', 'filled');
title('Bisection Method Root Finding');
xlabel('x');
ylabel('f(x)');
legend('f(x)', 'Roots');
grid on;
hold off;

