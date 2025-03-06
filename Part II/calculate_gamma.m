function gamma = calculate_gamma(f, x, y, dk, gamma_calculator)
    
    if strcmp(gamma_calculator, "constant")
        gamma = 0.1;
    elseif strcmp(gamma_calculator, "minimize") 
        gamma = minimize_gamma(f, x, y, dk);
    elseif strcmp(gamma_calculator, "armijo")
        gamma = armijo_gamma(f, x, y, dk);
    else
        error("Invalid gamma calculator");
    end
end