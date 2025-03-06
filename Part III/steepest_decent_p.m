function [x_min, f_min, f_values, iterations] = steepest_decent_p(e, f, start_x, gamma, sk)
    % Initialize variables
    iterations = 1;
    xk = start_x;
    f_values = [f(xk)];

    grad_fk = gradient_f(xk);

    % Restraints
    x_rest = [-10, 5; -8, 12];
    
    while double(norm(grad_fk)) > e && iterations < 500
        dk = -grad_fk;
        
        x_bar = xk + (sk * dk)';
        
        % Project x_bar on restraints
        for i = 1:length(x_bar)
            if x_bar(i) < x_rest(i,1)
                x_bar(i) = x_rest(i,1);
            elseif x_bar(i) > x_rest(i,2)
                x_bar(i) = x_rest(i,2);
            end
        end
        
        xk = xk + gamma * (x_bar - xk);
        f_values = [f_values; f(xk)];
        grad_fk = gradient_f(xk);
        iterations = iterations + 1;
    end
    x_min = xk;
    f_min = f(x_min);
    
end 