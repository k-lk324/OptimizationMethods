clc;

[x, y] = meshgrid(-4:0.1:4);
z = x .^ 5 .* exp(-x.^2 - y.^2);

mesh(z);
xlabel('x');
ylabel('y');
zlabel('f(x, y)');
title('Surface plot of f(x, y)');