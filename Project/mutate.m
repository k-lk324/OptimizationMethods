function mutated_children = mutate(children, mutation_rate, capacity_vec)
    n_children = length(children);
    n_roads = length(capacity_vec);
    mutated_children = children;
    
    for i = 1:n_children
        for j = 1:n_roads
            if rand() < mutation_rate
                % Apply a small random perturbation instead of completely randomizing the value
                perturbation = (rand() - 0.5) * 0.2 * capacity_vec(j); % ±10% of capacity
                mutated_value = mutated_children{i}(j) + perturbation;
                
                % Ensure the mutated value stays within bounds
                mutated_children{i}(j) = max(0, min(mutated_value, capacity_vec(j)));
            end
        end
    end
end
