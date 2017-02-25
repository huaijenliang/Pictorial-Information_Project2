function [ output ] = invAlong3Dim( input )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

s = size(input);
I = eye(s(1:2));
output = zeros(s);
for i = 1:s(3)
    output(:, :, i) = input(:, :, i)\I;
end

end

