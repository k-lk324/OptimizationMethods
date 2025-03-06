function children = crossover(parents, n_children)
    % Initialize children
    children = cell(n_children, 1);
    num_parents = length(parents);
    
    for i = 1:n_children
        % Ensure two different parents are chosen
        idx1 = randi(num_parents);
        idx2 = randi(num_parents);
        while idx1 == idx2
            idx2 = randi(num_parents);
        end
        parent1 = parents{idx1};
        parent2 = parents{idx2};
        
        % Perform single-point crossover in the 50-70% range
        len = length(parent1);
        crossover_point = round(len * (0.5 + 0.2 * rand()));
        
        % Create a new child by combining genes from both parents
        child = [parent1(1:crossover_point), parent2(crossover_point+1:end)];
        
        children{i} = child;
    end
end
