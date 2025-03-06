function [ak, bk, num_iter] = goldenSection(func, a1, b1, l)
    %Initialization
    gamma = 0.618;
    k = 1;
    a = a1;
    b = b1;

    x1 = a + (1 - gamma) * (b - a);
    x2 = a + gamma * (b - a);

    f_x1k = func(x1);
    f_x2k = func(x2);
    
    while b - a >= l
        if f_x1k > f_x2k
            a = x1;    
            x1 = x2;
            x2 = a + gamma * (b - a);
        
            f_x1k = func(x1); 
            f_x2k = func(x2)
        else
            b = x2;
            x2 = x1;
            x1 = a + (1 - gamma) * (b - a);

            f_x1k = func(x1);
            f_x2k = func(x2);
        end  
        k = k + 1;
    end
    ak = a;
    bk = b;
    num_iter = k;
    return;
end