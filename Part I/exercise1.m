clc;
close all;
clear all;
% Functions to optimize
f1 = @(x) (x-2)^2 + x*log(x+3);
f2 = @(x) exp(-2*x) - (x-2)^2;
f3 = @(x) exp(x)*(x^3-1) + (x+1)*sin(x);
% Define the interval [a, b]
a = 1;
b = 3;


%% Run the bisection method for each step size
% Define the tolerance
l = 0.01;
step = (49:-3:10) .* 1e-4;

iterations_f1 = zeros(size(step));
iterations_f2 = zeros(size(step));
iterations_f3 = zeros(size(step));

for i = 1:length(step)
    [~, ~, num_iter] = bisectionMethod(f1, a, b, step(i), l);
    iterations_f1(i) = num_iter;
        
    [~, ~, num_iter] = bisectionMethod(f2, a, b, step(i), l);
    iterations_f2(i) = num_iter;
    
    [~, ~, num_iter] = bisectionMethod(f3, a, b, step(i), l);
    iterations_f3(i) = num_iter;    
end

% Plot the results
figure;
plot(step, iterations_f1*2, '-o', 'DisplayName', 'f1');
hold on;
plot(step, iterations_f2*2, '-x', 'DisplayName', 'f2');
plot(step, iterations_f3*2, '-s', 'DisplayName', 'f3');
hold off;

xlabel('ε Values');
ylabel('Number of function evaluations');
title('Bisection Method');
legend('show');
grid on;


%% Run the bisection method for each interval length
% Define the step size
step = 0.001;
l = [1, 0.5, 0.3, 0.2, 0.1, 0.05, 0.02, 0.01, 0.005, 0.003];

iterations_f1 = zeros(size(l));
iterations_f2 = zeros(size(l));
iterations_f3 = zeros(size(l));

lower_bounds_f1 = zeros(size(l));
upper_bounds_f1 = zeros(size(l));

lower_bounds_f2 = zeros(size(l));
upper_bounds_f2 = zeros(size(l));

lower_bounds_f3 = zeros(size(l));
upper_bounds_f3 = zeros(size(l));


for i = 1:length(l)
    [lower_bound, upper_bound, num_iter] = bisectionMethod(f1, a, b, step, l(i));
    iterations_f1(i) = num_iter;
    lower_bounds_f1(i) = lower_bound;
    upper_bounds_f1(i) = upper_bound;
    
    [lower_bound, upper_bound, num_iter] = bisectionMethod(f2, a, b, step, l(i));
    iterations_f2(i) = num_iter;
    lower_bounds_f2(i) = lower_bound;
    upper_bounds_f2(i) = upper_bound;
    
    [lower_bound, upper_bound, num_iter] = bisectionMethod(f3, a, b, step, l(i));
    iterations_f3(i) = num_iter;
    lower_bounds_f3(i) = lower_bound;
    upper_bounds_f3(i) = upper_bound;
    
end

% Plot the results
figure;
plot(l, iterations_f1*2, '-o', 'DisplayName', 'f1');
hold on;
plot(l, iterations_f2*2, '-x', 'DisplayName', 'f2');
plot(l, iterations_f3*2, '-s', 'DisplayName', 'f3');
hold off;

xlabel('Interval length');
ylabel('Number of function evaluations');
title('Bisection Method');
legend('show');
grid on;


%% Plot the interval bounds for different interval lengths
figure;
plot(iterations_f1, lower_bounds_f1, '-o', 'DisplayName', 'Lower bound');
hold on;
plot(iterations_f1, upper_bounds_f1, '-x', 'DisplayName', 'Upper bound');
hold off;
xlabel('Number of iterations');
ylabel('Interval bounds');
title('f1');
grid on;

figure;
plot(iterations_f2, lower_bounds_f2, '-o', 'DisplayName', 'Lower bound');
hold on;
plot(iterations_f2, upper_bounds_f2, '-x', 'DisplayName', 'Upper bound');
hold off;
xlabel('Number of iterations');
ylabel('Interval bounds');
title('f2');
grid on;

figure;
plot(iterations_f3, lower_bounds_f3, '-o', 'DisplayName', 'Lower bound');
hold on;
plot(iterations_f3, upper_bounds_f3, '-x', 'DisplayName', 'Upper bound');
hold off;
xlabel('Number of iterations');
ylabel('Interval bounds');
title('f3');
grid on;
