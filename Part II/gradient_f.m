function grad = gradient_f(xk, yk)
    % Gradient of the function
    syms x y;
    f = x^5 * exp(-x^2 - y^2);

    grad = subs(gradient(f, [x, y]), [x, y], [xk, yk]);
end