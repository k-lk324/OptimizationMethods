function f = f(x)
    f = 1/3 * x(1) ^ 2 + 3 * x(2) ^ 2;
end

e = 0.01;
starting_points = [8, -10];
gamma = 0.2;
sk = 0.1;
[x_min, f_min, f_values, iterations] = steepest_decent_p(e, @f, starting_points, gamma, sk);

fprintf('sk: %.1f | gamma: %.1f | Iterations: %d | f_min: %.4f\n', gamma, sk, iterations, f_min);

figure;
plot(1:length(f_values), f_values, 'LineWidth', 2, 'DisplayName', ...
                sprintf('Gamma: %.1f', gamma));
xlabel('Iterations');
ylabel('f(x)');
title('Steepest Descent with Projection | sk = 0.1, gamma = 0.2');

saveas(gcf, 'part4.png');