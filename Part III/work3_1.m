function f = f(x)
    f = 1/3 * x(1) ^ 2 + 3 * x(2) ^ 2;
end

e = 0.001;  % Define the tolerance for convergence

% Define starting points
starting_points = [10, 10];
gamma = [0.1, 0.3, 3, 5];
figure;

for i=1:length(gamma)
    % Run the method
    [x_min, f_min, f_values, iterations] = steepest_decent(e, @f, starting_points, gamma(i));

    fprintf('Gamma: %.1f | Iterations: %d | f_min: %.4f\n', gamma(i), iterations, f_min);

    % Plot the results
    plot(1:length(f_values), f_values, 'LineWidth', 2, 'DisplayName', ...
                sprintf('Gamma: %.1f', gamma(i)));
end

