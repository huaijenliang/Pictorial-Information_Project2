function [ outputImg ] = TPSWarp( images, fiducialPoints )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

destImgSize = size(images{1});

% find points that is in the convex
% triangulation
destTri= delaunay(fiducialPoints{1}(:, 1), fiducialPoints{1}(:, 2));
[pointsX, pointsY] = meshgrid(1:destImgSize(2), 1:destImgSize(1));
destPointsXY = [pointsX(:), pointsY(:)];
tIndex = tsearchn(fiducialPoints{1}, destTri, destPointsXY);
mask = isnan(tIndex);
destPointsXY(mask, :) = [];

% solve TPS mapping
TPSCoe = solveTPS(fiducialPoints{1}. fiducialPoints{2});
sourcePointsXY = TPSMapping(destPointsXY, TPSCoe, fiducialPoints{1});

%blending
outputImg = blending(images{1}, images{2}, destPointsXY, sourcePointsXY);

end

