function [ak, bk, k] = bisection_with_d(diff_func, a1, b1, l)
    syms x;
    % Initialization
    c = l / (b1 - a1);
    % Check if the interval is already smaller than the desired length
    if c > 1
        ak = a1;
        bk = b1;
        k = 0;
        return;
    end

    n = ceil(log(c) / log(0.5));

    k = 1;
    ak = a1;
    bk = b1;

    % Step 1
    while k < n
        xk = (ak + bk) / 2;
        diff_f_xk = subs(diff_func, x, xk);

        if abs(diff_f_xk) < 1e-6
            ak = xk;
            bk = xk;
            return;
        elseif diff_f_xk > 0
            bk = xk;
        else
            ak = xk;
        end
        k = k + 1;
    end

end