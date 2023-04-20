function o = inputSig(t)
    
    A = @(a) (a>=0) & (a<=1);
    B = @(b) (b>=1) & (b<=2);

    o = A(t).* t + B(t).* (1-t);
end

