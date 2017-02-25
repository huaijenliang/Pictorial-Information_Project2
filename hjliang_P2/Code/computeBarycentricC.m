function [ barycentricC ] = computeBarycentricC( points, triIndex, invM )
%UNTITLED3 Summary of this function goes here
%   barycentric : (h * w) x 3

numPoints = size(points, 1);
invTriM = invM(:, :, triIndex); % 3 x 3 x (h * w)
homP = [points, ones(numPoints, 1)];
homP = homP';
homP = reshape(homP, 3, 1, []);
barycentricC = mulAlong3Dim(invTriM, homP);
barycentricC = reshape(barycentricC, 3, []);
barycentricC = barycentricC';
% barycentric = barycentric ./ repmat(barycentric(:, 3), [1 3]);

end

