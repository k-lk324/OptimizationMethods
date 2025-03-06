function fit = fitness_function(x, t, a, c, lambda, V, flow_cons_mat)
    fit_inv = objective_function(x, t, a, c) + penalty_function(x, c, lambda, V, flow_cons_mat);
    fit = 1 / fit_inv;
end