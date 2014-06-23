%% read data
coins = imread('coins.png');
%% define sobel filter
sobel = [-1, 0, 1; -2, 0, 2; -1, 0, 1;];
threshold = 20; % use threshold to ignore some noise
base = 8;   % when padding make the length of padded picture a multiply of base which is 2^n
%% show the picture
pic = coins;
figure(1);
imshow(pic, []);
%% start a parallel pool using the default profile
parfor temp=1:1
end
%% execute edge detection
tic;
filter = sobel;

% padding the picture and filter
[ pic_padded, filter_padded ] = padding_par( pic, filter, base );
% transform the filter and picture into frequency space
filter_frequency = fft2_par( filter_padded );
pic_frequency = fft2_par(pic_padded);
% multiplication
pic_filtered_frequency = pic_frequency .* filter_frequency;
% inverse transform
pic_filtered = ifft2_par(pic_filtered_frequency);

pic_edge = abs(real(pic_filtered)) .* (abs(real(pic_filtered)) > threshold);
pic_edge = pic_edge / max(max(pic_edge)) * 255;
t = toc;
disp(t);    % record the time used
%% show the edge of the picture
figure(2);
imshow(pic_edge, []);
imwrite(uint8(pic_edge), 'coins_edge.png');