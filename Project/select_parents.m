% Tournament selection of parents

function parents = select_parents(pop, pop_fitness, n_parents)

    num_individuals = 10;
    parents = cell(n_parents, 1);

    for i = 1:n_parents
        % Randomly select a group of individuals
        group_indices = randperm(num_individuals, n_parents);
        group_fitness = pop_fitness(group_indices);
        
        % Select the best individual from the group
        [~, best_index] = max(group_fitness);
        parents{i} = pop{group_indices(best_index)};
    end

end
