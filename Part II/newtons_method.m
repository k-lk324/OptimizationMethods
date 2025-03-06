function [x_min, f_min, f_values, iterations] = newtons_method(e, f, start_x, gamma_calculator)
    % Initialize variables
    syms x y;
    iterations = 1;
    xk = start_x(1);
    yk = start_x(2);
    x_min = [xk, yk];
    f_min = double(subs(f, [x, y], x_min));
    f_values = [f_min];
    grad_fk = gradient_f(xk, yk);
    

    while double(norm(grad_fk)) > e && iterations < 500
        Hf = subs(hessian(f, [x, y]), [x, y], [xk, yk]);
        H_inv = inv(Hf);

        %Make sure that Hessian of f is positive definite
        % d = eig(Hf);
        % if ~all(d > 0)
        %     msg = 'Hessian of f is not positive definite';
        %     disp(msg);
        %     return;
        % end
        dk = - H_inv * grad_fk;

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

