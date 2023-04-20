%% Question 2 for the 335 assignment
% make fourier expansion of input x(n) = 1_{-N1<n<N1}

params = [[2, 1]; [20,5]; [20,20]; [20, 1]];

for i = 1:length(params)
    title_name = "Coeffecients for N = " + string(params(i,1)) + ", N_1 = " + string(params(i,2));
    output = x_hat(params(i, 1), params(i, 2), @x_of_n);

    figure
    hold on
    plot(abs(output.a_ks), 'x')
    plot(abs(output.a_ks))
    hold off
    title(title_name)
end

% for final plot
output = x_hat(20, 1, @x_of_n);
t = linspace(-25,25, 51);

figure
hold on
plot(t, abs(output.eval(t)), 'x')
plot(t, abs(output.eval(t)))
title('Output values of x_hat for N=20, N_1=1')
