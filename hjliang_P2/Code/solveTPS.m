function [ outputCoe ] = solveTPS( sourceKey, targetKey )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

% formulate TPS matrix
numPoints = size(sourceKey, 1);
P = [sourceKey, ones(numPoints, 1)];
tempSourceKey1 = reshape(sourceKey, [], 1, 2);
tempSourceKey2 = reshape(sourceKey, 1, [], 2);
sourceR1 = repmat(tempSourceKey1, 1, numPoints, 1);
sourceR2 = repmat(tempSourceKey2, numPoints, 1, 1);
R = sourceR1 - sourceR2;
R = sum(R .^ 2, 3);
mask = (R == 0);
K = R .* log(R);
K(mask) = 0;
M = [K, P; ...
     P', zeros(3, 3)];

% solve coefficient of TPS
vX = [targetKey(:, 1); zeros(3, 1)];
vY = [targetKey(:, 2); zeros(3, 1)];
lambda = 1e-3;
invM = (M + lambda * eye(numPoints + 3)) \ eye(numPoints + 3);
outputCoe = zeros(numPoints + 3, 2);
outputCoe(:, 1) = invM * vX;
outputCoe(:, 2) = invM * vY;
 
end

