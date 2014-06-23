function [ pic1_padded, pic2_padded ] = padding_par( pic1, pic2, base )
%PADDING padding the two pictures
[n1, m1] = size(pic1);
[n2, m2] = size(pic2);
p = n1 + n2 - 1;
q = m1 + m2 - 1;

p = ceil(p / base) * base;
q = ceil(q / base) * base;

pic1_padded = zeros(p, q);
pic2_padded = zeros(p, q);
pic1_padded(1:n1,1:m1) = pic1;
pic2_padded(1:n2,1:m2) = pic2;
end