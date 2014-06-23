function [ F] = fft_par( f )
%FFT_PAR 
% F and f should be array whose size is M * 1
    M = length(f);
    if mod(M, 2)==0 % M must be even
        K = M / 2;
        % if K is even, we can use FFT again
        if mod(K, 2)==1
            W_K = exp(-1i * 2 * pi / K);
            W_M = exp(-1i * 2 * pi / M);
            W_matrix = W_K .^ ((0:K-1)'*(0:K-1));
            F_even = W_matrix * (f(1:2:(M - 1)))';
            F_odd = W_matrix * (f(2:2:M))';
            F = zeros(M, 1);
            F_odd_add = F_odd .* (W_M .^ (0:K-1)).';
            F(1:K) = F_even + F_odd_add;
            F(K+1:M) = F_even - F_odd_add;
        else
            F_even = fft_par( f(1:2:(M - 1)) );
            F_odd = fft_par( f(2:2:M) );
            F = zeros(M, 1);
            W_M = exp(-1i * 2 * pi / M);
            F_odd_add = F_odd .* (W_M .^ (0:K-1)).';
            F(1:K) = F_even + F_odd_add;
            F(K+1:M) = F_even - F_odd_add;
        end
    elseif M==1
        F = f;
    else
        disp('ERROR:M should be even!')        
    end
end

