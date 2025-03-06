function grad_f = gradient_f(x)
    % Gradient of the function f(x, y) = 1/3 * x1 ^ 2 + 3 * x2 ^ 2
    grad_f = [2/3 * x(1); 6 * x(2)];
end