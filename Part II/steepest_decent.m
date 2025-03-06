function [x_min, f_min, f_values, iterations] = steepest_decent(e, f, start_x, gamma_calculator)
    % Initialize variables
    syms x y;
    iterations = 1;
    xk = start_x(1);
    yk = start_x(2);
    f_values = [double(subs(f, [x, y], [xk, yk]))];

    grad_fk = gradient_f(xk, yk);
    
    % Steepest descent algorithm
    while double(norm(grad_fk)) > e && iterations < 100
        dk = - grad_fk;

        gamma = calculate_gamma(f, xk, yk, dk, gamma_calculator);
        xk = double(xk + gamma * dk(1));
        yk = double(yk + gamma * dk(2));

        f_values = [f_values; double(subs(f, [x, y], [xk, yk]))];
        grad_fk = gradient_f(xk, yk);
        iterations = iterations + 1;
    end

    % Output the minimum point and function value
    x_min = xk;
    y_min = yk;
    f_min = double(subs(f, [x, y], [x_min, y_min]));
end