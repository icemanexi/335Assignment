%% Question 3
% a
t = linspace(-0.1,2.1,1000);
N = [5, 10, 15, 50];

o = zeros(size(t));
for i = 1:length(t)
    o(i) = inputSig(t(i)); % compute the output at each time point
end

figure
hold on
plot(t, o); % original function
xlabel('Time');
ylabel('Signal');
title('Signal');

for i = 1:length(N)
    plot(t, x_n(t, N(i)))
end

legend('Pure signal', 'N=5', 'N=10', 'N=15', 'N=50')

% we can see that as N increases, the function gets closer and closer to
% the pure function in the domain 0<t<2

% b 
%{ 

Since L_2 ([0,2],C) is a Hilbert space and the set of functions A = 
{(1/sqrt(P)) * e^(i2πk*t/P)} form a complete orthanormal sequence in L_2,
it is possible to make a sequence of functions from the set A that converge
to any function belonging to L_2 in accordance to the L_2 norm. Then, the
lim_{N->inf} int(x-x_N)^2dt = 0 by the definition of convergence in the L_2
norm.

%}

% c

%{ 
Convergence in L_2 does not garuntee that x_N will be the same as x, since
x_N and x could differ at finetely many points, each of which will
contribute nothing to the integral of the L_2 norm, and therefor not
violate the L_2 norm while still differing at finetely many points.

Since they could possible differ at finetely many points, this does NOT
garuntee that lim_{N->inf} sup_{0<t<2}|x-x_N| = 0.

%}


%c: For a general x(t) in L2([0, 2]; C), the convergence of xN(t) to x(t) in the L2 sense does 
% not guarantee pointwise convergence, for example, sup| x(t) - xN(t) | as N → ∞ may not be 0. 
% This is because the convergence in L2 sense is a global convergence in the sense that the error
% between the original signal and its approximation is small when integrated over the entire 
% interval, but it doesn't necessarily mean the error is small at every single point. 
% There exist counterexamples in the L2 space where the Fourier series converges in the L2 sense
% but not pointwise.







