%% 335 Problem 1
% Thomas Emo, 2023-03-27
% 20239238

%% Bernstein polynomials are dense in C([0,1])
%B_n_f(t) = [sum_k=0^n][f(k/n)(nCk)t^k(1-t)^(n-k)]

% Given a trigonomic function h(t), and n (order of approximation), 
% generate the Bernstein polynomial approximation f of the signal h

% eg h(t) = 2sin(pi*t/4) + 3cos(pi*t/2)

% verify that sup_t[0,1]|f(t) - B_nf(t)| decreases as n increases

inputFunc = @(t) (2*sin(pi*t/4) + 3*cos(pi*t/2));
ss = 0.0001;
t = 0:ss:1;

% calculate bernstien approximation
B = [[]];
for i = 1:3
    n = 10*i;
    temp = [];
    for j = t
        temp = [temp, Bernstein(inputFunc, n, j)];
    end
    B(i, :) = temp;
end

% plot the input function and approximations
figure
hold on
plot(t, inputFunc(t), "LineWidth",1)
plot(t, B(1,:))
plot(t, B(2,:))
plot(t, B(3,:))
legend('Real Function', 'n=10', 'n=20', 'n=30')
hold off

% find and print max error in console
for i = 1:3
    e = max(abs(inputFunc(t) - B(i,:)));
    fprintf("The maximum difference between approx. n=%d and " + ...
        "the input function is: %.2f\n", [i, e]);
end


% Can see that as n increases, the maximum different between the 
% two functions decreases, suggesting that the approximation is
% becoming more and more accurate

