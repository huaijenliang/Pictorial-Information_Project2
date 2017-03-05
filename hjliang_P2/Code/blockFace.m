function [ outputImg ] = blockFace( inputImg, points )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
s = size(inputImg);
bw = zeros(s(1:2));
index = sub2ind(s(1:2), points(:, 2), points(:, 1));
bw(index) = 1;
ch = bwconvhull(bw);
outputImg = inputImg;

for c = 1:s(3)
    temp = outputImg(:, :, c);
    temp(ch) = 0;
    outputImg(:, :, c) = temp;
end

% minX = min(points(:, 1));
% maxX = max(points(:, 1));
% minY = min(points(:, 2));
% maxY = max(points(:, 2));
% outputImg = inputImg;
% outputImg(minY:maxY, minX:maxX, :) = 0;

end

