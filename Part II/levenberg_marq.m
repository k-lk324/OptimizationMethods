function [x_min, f_min, f_values, iterations] = levenberg_marq(e, f, start_x, gamma_calculator)
    % Initialize variables
    syms x y;
    iterations = 1;
    xk = start_x(1);
    yk = start_x(2);
    x_min = [xk, yk];
    f_min = double(subs(f, [x, y], x_min));
    f_values = [f_min];
    grad_fk = gradient_f(xk, yk);
    H_f = hessian(f, [x, y]);

    
    while double(norm(grad_fk)) > e && iterations < 100
        Hf = subs(H_f, [x, y], [xk, yk]);

        % Increasing temp_mi by one until the matrix syst is positive difinite
        temp_mi = 1;
        syst = Hf + temp_mi * eye(2);
        ds = eig(syst);

        
        while ~all(ds > 0)
            temp_mi = temp_mi + 1;
            syst = Hf + temp_mi * eye(2);
            ds = eig(syst);
        end

        dk = -inv(syst) * gradient_f(xk, yk);

        gamma = calculate_gamma(f, xk, yk, dk, gamma_calculator);
        xk = double(xk + gamma * dk(1));
        yk = double(yk + gamma * dk(2));

        f_values = [f_values; double(subs(f, [x, y], [xk, yk]))];
        grad_fk = gradient_f(xk, yk);
        iterations = iterations + 1;
    end
    % Output the minimum point and function value
    x_min = [xk, yk];
    f_min = double(subs(f, [x, y], x_min));
end