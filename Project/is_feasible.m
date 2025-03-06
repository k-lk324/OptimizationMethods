function F = is_feasible(x, c, V, flow_cons_mat)
    F = true;
    % Constraint 1: x should not exceed the capacity c
    for i = 1:length(x)
        if x(i) > c(i)
            % disp('Capacity constraint is not satisfied');
            F = false;
        end
    end

    % Constraint 2: Flow conservation in nodes
    for j = 2:size(flow_cons_mat, 1) - 1
        flow_conservation = sum(flow_cons_mat(j, :) .* x);
        if abs(flow_conservation) > 1e-6
            % disp('Flow conservation is not satisfied');
            F = false;
        end
    end

    % Constraint 3: Input flow should be equal to V
    input_flow = sum(x(flow_cons_mat(1, :) == 1));
    if abs(input_flow - V) > 1e-6
        % disp('Input flow is not equal to V');
        F = false;
    end
end