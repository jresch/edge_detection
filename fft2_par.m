function [ complex ] = fft2_par( pic )
%FFT2_PAR use 1-D FFT to calculate 2-D FFT
    [M, N] = size(pic);
    complex = zeros(M, N);
    F_x_v = zeros(M, N);
    parfor x = 1:M
        F_x_v(x, :) = fft_par( pic(x, :)).';
    end
    parfor v = 1:N
        complex(:, v) = fft_par( F_x_v(:, v).');
    end

end

