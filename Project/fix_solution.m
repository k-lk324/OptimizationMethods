function fixed_solution = fix_solution(solution, V, capacity_vec)
    x = solution;

    % Constraint 1: Flow conservation in nodes
    x(1) = x(5) + x(6);
    x(10) = x(4) - x(9);
    x(11) = x(17) - x(4) + x(9);
    x(12) = -x(15) - x(16) - x(17) + V;
    x(13) = x(15) + x(16) - x(5) - x(6) - x(7);
    x(14) = x(16) - x(5);
    x(2) = x(7) + x(8);
    x(3) = -x(4) - x(5) - x(6) - x(7) - x(8) + V;

    % Constraint 2: Capacity constraints
    x = min(x, capacity_vec);

    fixed_solution = x;
end