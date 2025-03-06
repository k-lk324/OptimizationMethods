% Define your objective function f and its gradient using symbolic variables
syms x y;
f = x^5 * exp(-x^2 - y^2);  
e = 0.05;  % Define the tolerance for convergence

% Define starting points
starting_points = [
    0, 0;
    -1, 1;
    1, -1
];

% Define gamma calculators (string inputs)
gamma_calculators = {'constant', 'minimize', 'armijo'};
gamma_labels = {'Constant', 'Minimize', 'Armijo'};

% Preallocate results storage
results = struct();

% Run optimization for each method, starting point, and gamma strategy
methods = {@steepest_decent, @newtons_method, @levenberg_marq};
method_names = {'SteepestDecent', 'NewtonsMethod', 'LevenbergMarq'};

% Loop through each method, starting point, and gamma strategy
for m = 1:length(methods)
    method = methods{m};
    method_name = method_names{m};
    results.(method_name) = [];
    
    for i = 1:size(starting_points, 1)
        start_x = starting_points(i, :);
        
        for j = 1:length(gamma_calculators)
            gamma_label = gamma_labels{j};
            gamma_calculator = gamma_calculators{j};            
            
            % Run the method
            [x_min, f_min, f_values, iterations] = method(e, f, start_x, gamma_calculator);
            
            % Store results
            result = struct();
            result.starting_point = start_x;
            result.gamma_strategy = gamma_label;
            result.x_min = x_min;
            result.f_min = f_min;
            result.iterations = iterations;
            result.f_values = f_values;  % Store the function values
            
            % Append to results for the current method
            results.(method_name) = [results.(method_name); result];
            

            % Display results
            fprintf('Method: %s | Start: (%.2f, %.2f) | Gamma: %s | Iterations: %d | f_min: %.4f\n', ...
                method_name, start_x(1), start_x(2), gamma_label, iterations, f_min);
        end
    end
end

% Save results to a file for analysis
save('optimization_results.mat', 'results');


% Plot convergence for each method and starting point
for m = 1:length(methods)
    method_name = method_names{m};
    method_results = results.(method_name);
    
    % Loop through each starting point
    for i = 1:size(starting_points, 1)
        start_x = starting_points(i, :); % Current starting point
        
        % Create a figure for the current method and starting point
        figure;
        hold on;
        title(sprintf('Convergence of %s | Starting Point (%.2f, %.2f)', ...
            method_name, start_x(1), start_x(2)));
        xlabel('Iterations');
        ylabel('Objective Function Value');
        
        % Filter results for the current starting point
        method_results_start = method_results(arrayfun(@(r) all(r.starting_point == start_x), method_results));
        
        % Plot results for each gamma strategy
        for j = 1:length(method_results_start)
            f_values = method_results_start(j).f_values;
            gamma_label = method_results_start(j).gamma_strategy;
            
            % Plot convergence
            plot(1:length(f_values), f_values, 'LineWidth', 2, 'DisplayName', ...
                sprintf('Gamma: %s', gamma_label));
        end
        
        % Add legend to distinguish gamma strategies
        legend('show');
        hold off;
    end
end
