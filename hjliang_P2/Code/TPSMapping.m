function [ mapPoints ] = TPSMapping( points, TPSCoe, keyPoints )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

numPoints = size(points, 1);
numKeyPoints = size(keyPoints, 1);
tempPoints = reshape(points, [], 1, 2);
tempPoints = repmat(tempPoints, 1, numKeyPoints, 1);
tempKeyPoints = reshape(keyPoints, 1, [], 2);
tempKeyPoints = repmat(tempKeyPoints, numPoints, 1, 1);
R = tempKeyPoints - tempPoints;
R = sum(R .^ 2, 3);
mask = (R == 0);
U = R .* log(R);
U(mask) = 0;
M = [U, points, ones(numPoints, 1)];
mapPoints = M * TPSCoe;

end

