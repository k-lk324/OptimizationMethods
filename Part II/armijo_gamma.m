function gamma = armijo_gamma(f, xk, yk, d)

    syms x y
    func = matlabFunction(f, 'Vars', {[x, y]});
 
    a = 10^(-4);
    b = 0.5;
    s = 0.5;
    
    temp_mk = 0;
    gamma = s * (b ^ temp_mk);
    temp = [xk, yk] - (gamma * gradient_f(xk, yk))';


    while (func([xk, yk]) - func([temp(1), temp(2)]) < - a * (b ^ temp_mk) * s * (d') * gradient_f(xk, yk))
        temp_mk = temp_mk + 1;
        gamma = s * (b ^ temp_mk);
        temp = [xk, yk] - (gamma * gradient_f(xk, yk))';
    end
end