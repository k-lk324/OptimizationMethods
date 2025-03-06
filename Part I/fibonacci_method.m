function [an, bn, N, evaluations] = fibonacci_method(func, a1, b1, l, e)
    % Initialization
    N = determine_iterations(a1, b1, l);
    a = a1;
    b = b1;

    x1 = a1 + (fibonacci(N-2) / fibonacci(N)) * (b1 - a1);
    x2 = a1 + (fibonacci(N-1) / fibonacci(N)) * (b1 - a1);

    f_x1k = func(x1);
    f_x2k = func(x2);
    evaluations = 2;

    k = 1;

    % Step 1
    while true

        if f_x1k > f_x2k
            % Step 2
            a = x1; % bk+1 = bk;
            x1 = x2;
            x2 = a + (fibonacci(N-k-1) / fibonacci(N-k)) * (b - a);

            if k ~= N - 2
                f_x2k = func(x2);
                evaluations = evaluations + 1;
                % Step 4
                k = k + 1;
            end
        else
            % Step 3
            b = x2; % ak+1 = ak;
            x2 = x1;
            x1 = a + (fibonacci(N-k-2) / fibonacci(N-k)) * (b - a);

            if k ~= N - 2
                f_x1k = func(x1);
                evaluations = evaluations + 1;
                % Step 4
                k = k + 1;
            end

        end

        %  Step 5
        if k == N - 2
            x2 = x1 + e;
            f_x2k = func(x2);
            evaluations = evaluations + 1;

            if f_x1k > f_x2k
                an = x1;
                bn = b;
            else
                an = a;
                bn = x2;
            end
            return;
        end
    end
end