function [out] = x_of_n(in,N_1)
%INPUT Summary of this function goes here
%   Detailed explanation goes here

if (-N_1 <= in) && (in <= N_1)
    out = 1;
else
    out = 0;
end

