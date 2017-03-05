function [ outputImg ] = blending( destImg, sourceImg, destXY, sourceXY )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

% destImg = double(destImg);
% sourceImg = double(sourceImg);
d = imGradFeature(destImg);
s = imGradFeature(sourceImg);
newD = zeros(size(d));
for i = 1:5
    newD(:, :, :, i) = copyPixel(d(:, :, :, i), s(:, :, :, i), destXY, sourceXY);
end

param = buildModPoissonParam(size(newD));
% imagesc(newD(:, :, :, 1))
outputImg = modPoisson(newD, param, 1E-8);
outputImg = uint8(outputImg);
% destS = size(destImg);
% tempImg = copyPixel(destImg, sourceImg, destXY, sourceXY);
% mask = zeros(destS(1), destS(2));
% destIndex = sub2ind(destS(1:2), destXY(:, 2), destXY(:, 1));
% mask(destIndex) = 1;
% mask = repmat(mask, 1, 1, 3);
% [dh, dv] = imgrad(destImg);
% [sh, sv] = imgrad(sourceImg);
% newdh = copyPixel(dh, sh, destXY, sourceXY);
% newdv = copyPixel(dv, sv, destXY, sourceXY);
% outputImg = PoissonGaussSeidel(tempImg, newdh, newdv, mask);


end

