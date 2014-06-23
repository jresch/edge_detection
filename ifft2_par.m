function [ pic ] = ifft2_par( complex )
%IFFT2_PAR use 2-D FFT to calculate 2-D IFFT
    pic = fft2_par( conj(complex) );
    [M, N] = size(pic);
    pic = conj(pic) / M / N;
end

