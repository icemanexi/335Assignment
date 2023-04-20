function [result] = Bernstein(foo, n, t)
% [sum_k=0^n][f(k/n)(nCk)t^k(1-t)^(n-k)]

bernTerm = @(k) (foo(k/n) * nchoosek(n,k) * t^k * (1-t)^(n-k));

result = 0;

for k = 0:n
    result = result + bernTerm(k);
end

end