classdef x_hat
    properties
        N;
        N_1
        a_ks;
        x;
    end
    
    methods
        function obj = x_hat(N, N_1, x)
            obj.N = N;
            obj.N_1 = N_1;
            obj.x = x;
            obj.a_ks = FourSeries(N, N_1);
        end

        function out = eval(obj, n)
            out = 0;
            for k = -obj.N:obj.N
                out = out + a_k(k, obj.x, obj.N, obj.N_1) * exp(1i*k*n*2*pi/(2*obj.N+1));
            end
            out = out * (1/sqrt(2*obj.N+1));
        end

    end
end
