function [coeff] = a_k(k, x, N, N_1)
%A_K Summary of this function goes here
%   Detailed explanation goes here
coeff = 0;

for i = -N:N
    coeff = coeff +  x(i, N_1) * exp(-1i*k*(2*pi/(2*N+1))*i);
end

coeff = coeff*(1/(sqrt(2*N+1)));

end

