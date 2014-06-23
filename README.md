# Introduction
This demo use FFT to realize edge detection in MATLAB.

The post about this demo is: [post address](http://mathpluscode.com/an-introduction-of-fourier-transform-edge-detection/). If you have any questions, you can write comments in the post.

# Explanations of functions

1. **fft_par**: 1-D FFT using parfor
2. **fft2_par**: 2-D FFT using 1-D FFT
3. **ifft2_par**: 2-D IFFT using 2-D FFT
4. **padding_par**: padding the images using parfor