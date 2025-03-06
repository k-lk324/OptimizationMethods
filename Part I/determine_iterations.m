function N = determine_iterations(a1, b1, l)
    % Target ratio for Fibonacci sequence
    target = (b1 - a1) / l;
    
    % Generate Fibonacci numbers until F(N+1) >= target
    F_prev = 1;  % F(1)
    F_curr = 1;  % F(2)
    N = 1;       % Start at F(2)
    
    % Continue generating until the condition is met
    while F_curr < target
        F_next = F_prev + F_curr;  % Next Fibonacci number
        F_prev = F_curr;           % Move to next in sequence
        F_curr = F_next;
        N = N + 1;
    end
end
