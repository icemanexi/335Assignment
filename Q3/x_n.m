function [o] = x_n(a, N)
P = 2;
o = 0;

for k = -N:N
    o = o + 1/sqrt(P) * fCoeff(k) * exp(1i*2*pi*k*a/P);
end

end

