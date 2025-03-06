% TODO: Check if this is the correct way to initialize the population

function pop = initialize_pop(popSize, nVar, c)
% Initialize the population with random float values

    pop = cell(popSize, 1);
    for i = 1:popSize
        pop{i} = rand(1, nVar) .* c;
    end

end
