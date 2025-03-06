function new_pop = select_survivors(pop, pop_fitness, children, children_fitness, pop_size)
    % Combine the population and children
    combined_pop = [pop; children];

    combined_fitness = [pop_fitness, children_fitness];
    
    % Sort the combined population by fitness in descending order
    [~, sorted_indices] = sort(combined_fitness, 'descend');
    
    % Select the best individuals to form the new population
    new_pop = combined_pop(sorted_indices(1:pop_size));
    
end