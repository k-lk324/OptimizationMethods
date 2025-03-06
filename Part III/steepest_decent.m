function [x_min, f_min, f_values, iterations] = steepest_decent(e, f, start_x, gamma)
    % Initialize variables
    iterations = 1;
    xk = start_x;
    f_values = [f(xk)];

    grad_fk = gradient_f(xk);
    
    while double(norm(grad_fk)) > e && iterations < 500
        dk = - grad_fk;
        xk = xk + gamma * dk';

        f_values = [f_values; f(xk)];
        grad_fk = gradient_f(xk);
        iterations = iterations + 1;
    end

    % Output the minimum point and function value
    x_min = xk;
    f_min = f(x_min);
end