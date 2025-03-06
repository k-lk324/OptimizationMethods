function min_gamma = minimize_gamma(f, xk, yk, dk)
    % Convert symbolic function f to a MATLAB function
    syms x y
    f_func = matlabFunction(f, 'Vars', {[x, y]});
    
    % Define the function to minimize with respect to gamma
    func = @(g) f_func([xk + g * dk(1), yk + g * dk(2)]);

    % Use a golden-section search or other method to minimize func
    [a, b, ~] = goldenSection(func, 0, 1, 0.01);  % Customize the range and tolerance as needed

    % Calculate the midpoint of the final interval
    min_gamma = (a + b) / 2;
end
