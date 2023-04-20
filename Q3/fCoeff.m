function [o] = fCoeff(k)
    P = 2;
    T = 2;
    % was impossible to use the integral function with my inputSig
    % function, for some reason if statements / logical operations inside a
    % function break the integral function. So instead I do this:
    sig1 = @(t) t.* exp(-1i*2*pi*k*t*(1/P));
    sig2 = @(t) (1-t).* exp(-1i*2*pi*k*t*(1/P));

    o = integral(sig1, 0, 1) + ...
        integral(sig2, 1, 2);

    o = o * 1/sqrt(P);
end

