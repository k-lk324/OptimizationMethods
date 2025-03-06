function Fn = fibonacci(n)
    if n <= 0
        error('Input must be a positive integer.');
    elseif n == 1
        Fn = 1;
    elseif n == 2
        Fn = 1;
    else
        F = zeros(1, n);
        F(1) = 1;
        F(2) = 1;
        for i = 3:n
            F(i) = F(i-1) + F(i-2);
        end
        Fn = F(n);
    end
end