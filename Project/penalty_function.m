function P = penalty_function(x, c, lambda, V, flow_cons_mat)
    % PENALTY_FUNCTION Computes the penalty for constraint violations.
    %
    %   P = PENALTY_FUNCTION(x, c, lambda, V) computes the penalty value P for the 
    %   given input parameters based on the constraint violations.
    %
    %   Inputs:
    %       x - The solution vector.
    %       c - The maximum capacity of the road.
    %       lambda - A vector with three penalty factors for constraint violations.
    %       V - The flow inside the network.
    %
    %   Outputs:
    %       P - The computed penalty value.
    %
    
    % Initialize penalty
    P = 0;
    
    % Constraint 1: x should not exceed the capacity c
    for i = 1:length(x)
        if x(i) > c(i)
            P = P + lambda(1) * (x(i) - c(i))^2;
        end
    end

    % Constraint 2: Flow conservation in nodes
    % flow_cons_mat = flow_conservation_matrix();

    for j = 2:size(flow_cons_mat, 1) - 1
        flow_conservation = sum(flow_cons_mat(j, :) .* x);
        if flow_conservation ~= 0
            P = P + lambda(2) * flow_conservation^2;
        end
    end

    % Constraint 3: Input flow should be equal to V
    input_flow = sum(x(flow_cons_mat(1, :) == 1));
    if input_flow ~= V
        P = P + lambda(3) * (input_flow - V)^2;
    end

end
