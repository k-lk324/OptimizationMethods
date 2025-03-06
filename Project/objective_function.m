function T_sum = objective_function(x, t, a, c)
    T_sum = sum(t + (a .* x) ./ (1 - (x ./ c)));
end
