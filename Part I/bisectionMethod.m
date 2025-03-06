function [lower_bound, upper_bound, num_iter] = bisectionMethod(func, a, b, step, l)
    num_iter = 0;
    ak = a;
    bk = b;

    while bk - ak >= l
        num_iter = num_iter + 1;
        
        x1 = (ak + bk) / 2 - step;
        x2 = (ak + bk) / 2 + step;
            
        if func(x1) < func(x2)
            bk = x2;
        else
            ak = x1;
        end

    end

    lower_bound = ak;
    upper_bound = bk;
end