function [out] = FourSeries(N, N_1)
%FOURSERIES Summary of this function goes here
%   Detailed explanation goes here
out = [];

for k = -N:N
    out = [out, a_k(k, @x_of_n, N, N_1)];
end


end

