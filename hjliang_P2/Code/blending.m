function [ outputImg ] = blending( destImg, sourceImg, destXY, sourceXY )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

destS = size(destImg);
sourceS = size(sourceImg);
[x, y] = meshgrid(1:sourceS(2), 1:sourceS(1));
tempImg = copyPixel(destImg, sourceImg, destPointsXY, sourcePointsXY);
mask = zeros(destS(1), destS(2));
destIndex = sub2ind(destS(1:2), destXY(:, 2), destXY(:, 1));
mask(destIndex) = 1;
mask = repmat(mask, 1, 1, 3);
[dh, dv] = imgrad(destImg);
[sh, sv] = imgrad(sourceImg);
dh(destIndex) = interp2(x, y, sh, sourceXY(:, 1), sourceXY(:, 2));
dv(destIndex) = interp2(x, y, sv, sourceXY(:, 1), sourceXY(:, 2));
outputImg = PoissonGaussSeidel(tempImg, dh, dv, mask);


end

