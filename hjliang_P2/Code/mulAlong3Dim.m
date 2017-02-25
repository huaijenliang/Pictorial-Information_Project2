function [ output ] = mulAlong3Dim( A, B )
%UNTITLED4 Summary of this function goes here
%   A : m x n x k
%   B : n x l x k

k = size(A, 3);
output = zeros(size(A, 1), size(B, 2), k);

for i = 1:k
    output(:, :, i) = A(:, :, i) * B(:, :, i);
end


end

