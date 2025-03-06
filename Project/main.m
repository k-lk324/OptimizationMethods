% Define the parameters of the problem
pop_size = 200;
n_roads = 17;
num_nodes = 9;
V = 100;                    % The flow inside the network
lambda = [100, 100, 100];   % Penalty parameters
variable_V = false;         % Turn on/off +15%/-15% variation in V

% Genetic algorithm parameters
n_gen = 200;
if variable_V
    n_gen = 2000;
end
n_parents = 4;
n_children = 3;
mutation_rate = 0.15;

% Maximum capacity of the roads
capacity_vec = [54.13, 21.56, 34.08, 49.19, 33.03, 21.84, 29.96, 24.87, 47.24, ...
                33.97, 26.89, 32.76, 39.98, 37.12, 53.83, 61.65, 59.73];

% Road coefficients
road_coeff = [1.25 * ones(1, 5), 1.5 * ones(1, 5), ones(1, 7)];

% Constant time for each road
% Assume that the time is 0 for all roads for simplicity, as it cannot be minimized anyway
t = zeros(1, n_roads);
flow_cons_mat = flow_conservation_matrix();

% Initialize the population
pop = initialize_pop(pop_size, n_roads, capacity_vec);
pop = cellfun(@(x) fix_solution(x, V, capacity_vec), pop, 'UniformOutput', false);

% Evaluate the fitness of the initial population
pop_fitness = arrayfun(@(i) fitness_function(pop{i}, t, road_coeff, capacity_vec, lambda, V, flow_cons_mat), 1:pop_size);

% Initialize array to store the best fitness value at each generation
best_fitness_values = zeros(1, n_gen);
best_objective_values = zeros(1, n_gen);
Vo = V;

% Main loop: Run the genetic algorithm for a specified number of generations
for i = 1:n_gen
    if variable_V
        V = Vo * (1 + 0.15 * (2 * rand() - 1));
    end
        % Select the parents
    parents = select_parents(pop, pop_fitness, n_parents);
    
    % Crossover and mutation
    children = mutate(crossover(parents, n_children), mutation_rate, capacity_vec);
    
    % Evaluate the fitness of the children
    children_fitness = arrayfun(@(j) fitness_function(children{j}, t, road_coeff, capacity_vec, lambda, V, flow_cons_mat), 1:n_children);
    
    % Select the survivors
    pop = select_survivors(pop, pop_fitness, children, children_fitness, pop_size);
    pop = cellfun(@(x) fix_solution(x, V, capacity_vec), pop, 'UniformOutput', false);
    
    % Update the fitness of the population
    pop_fitness = arrayfun(@(j) fitness_function(pop{j}, t, road_coeff, capacity_vec, lambda, V, flow_cons_mat), 1:pop_size);
    pop_objective = arrayfun(@(j) objective_function(pop{j}, t, road_coeff, capacity_vec), 1:pop_size);

    % Store the best fitness value of the current generation
    best_fitness_values(i) = max(pop_fitness);
    best_objective_values(i) = max(pop_objective);

end

% Find the best solution
[best_fitness, best_index] = max(pop_fitness);
best_solution = pop{best_index};

% Check if the best solution is feasible
if ~is_feasible(best_solution, capacity_vec, V, flow_cons_mat)
    disp('The best solution is not feasible');
    real_flow = flow_cons_mat * best_solution';
end

% Print results
disp('Best solution:');
disp(best_solution);
disp('Best fitness:');
disp(best_fitness);
disp('Best objective value:');
disp(objective_function(best_solution, t, road_coeff, capacity_vec));
disp('Penalty value:');
disp(penalty_function(best_solution, capacity_vec, lambda, V, flow_cons_mat));

% Plot the convergence of the genetic algorithm
figure;
plot(1:n_gen, best_fitness_values, 'LineWidth', 2);
xlabel('Generation');
ylabel('Best Fitness Value');
title('Convergence of the Genetic Algorithm');
grid on;

if variable_V
    % Smooth the plot for better visualization
    hold on;
    smoothed_values = movmean(best_fitness_values, 100);
    plot(1:n_gen, smoothed_values, 'r-', 'LineWidth', 2);
    legend('Original', 'Smoothed');
    hold off;
end
