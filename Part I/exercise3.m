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
e = 0.0001;


%% Run the golden section method for each interval length
l = [0.5, 0.3, 0.2, 0.1, 0.05, 0.02, 0.01, 0.005, 0.003];

iterations_f1 = zeros(size(l));
iterations_f2 = zeros(size(l));
iterations_f3 = zeros(size(l));

lower_bounds_f1 = zeros(size(l));
upper_bounds_f1 = zeros(size(l));

lower_bounds_f2 = zeros(size(l));
upper_bounds_f2 = zeros(size(l));

lower_bounds_f3 = zeros(size(l));
upper_bounds_f3 = zeros(size(l));

evals_f1 = zeros(size(l));
evals_f2 = zeros(size(l));
evals_f3 = zeros(size(l));


for i = 1:length(l)
    [lower_bound, upper_bound, num_iter, evals] = fibonacci_method(f1, a, b, l(i), e);
    iterations_f1(i) = num_iter;
    lower_bounds_f1(i) = lower_bound;
    upper_bounds_f1(i) = upper_bound;
    evals_f1(i) = evals;
    
    [lower_bound, upper_bound, num_iter, evals] = fibonacci_method(f2, a, b, l(i), e);
    iterations_f2(i) = num_iter;
    lower_bounds_f2(i) = lower_bound;
    upper_bounds_f2(i) = upper_bound;
    evals_f2(i) = evals;
    
    [lower_bound, upper_bound, num_iter, evals] = fibonacci_method(f3, a, b, l(i), e);
    iterations_f3(i) = num_iter;
    lower_bounds_f3(i) = lower_bound;
    upper_bounds_f3(i) = upper_bound;
    evals_f3(i) = evals;
    
end


% Plot the results
figure;
plot(l, evals_f1, '-o', 'DisplayName', 'f1');
hold on;
plot(l, evals_f2, '-x', 'DisplayName', 'f2');
plot(l, evals_f3, '-s', 'DisplayName', 'f3');
hold off;

xlabel('Interval length');
ylabel('Number of function evaluations');
title('Fibonacci Method');
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