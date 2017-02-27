function [ outputImg ] = TPSWarp( images, fiducialPoints )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

destImgSize = size(images{1});

% find points that is in the convex formed by fiducial points
[pointsX, pointsY] = meshgrid(1:destImgSize(2), 1:destImgSize(1));
destConvhull = convhull(fiducialPoints{1}(:, 1), fiducialPoints{1}(:, 2));
destInConv = inpolygon(pointsX, pointsY, fiducialPoints{1}(destConvhull, 1), fiducialPoints{1}(destConvhull, 2));
destPointsXY = [pointsX(destInConv), pointsY(destInConv)];

% solve TPS mapping
TPSCoe = solveTPS(fiducialPoints{1}, fiducialPoints{2});
sourcePointsXY = TPSMapping(destPointsXY, TPSCoe, fiducialPoints{1});

%blending
outputImg = blending(images{1}, images{2}, destPointsXY, sourcePointsXY);

end

