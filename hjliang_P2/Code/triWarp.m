function [ outputImg ] = triWarp( destImg, sourceImg, fiducialPoints )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

destImgSize = size(destImg);
% triangulation
destTri= delaunay(fiducialPoints{1}(:, 1), fiducialPoints{1}(:, 2));

% find corresponding triangle's index for each points
[pointsX, pointsY] = meshgrid(1:destImgSize(2), 1:destImgSize(1));
destPointsXY = [pointsX(:), pointsY(:)];
tIndex = tsearchn(fiducialPoints{1}, destTri, destPointsXY);
mask = isnan(tIndex);
destPointsXY(mask, :) = [];
tIndex(mask) = [];

% compute inverse of each triangle
destM = formTriangleMatrice(fiducialPoints{1}, destTri);
invDestM = invAlong3Dim(destM);

% transform to barycentric coordinate
destBary = computeBarycentricC(destPointsXY, tIndex, invDestM);

sourceM = formTriangleMatrice(fiducialPoints{2}, destTri);
sourcePoints = computeImageC(destBary, tIndex, sourceM);
sourcePointsXY = sourcePoints(:, 1:2);
% images{1} = im2double(images{1});
% images{2} = im2double(images{2});

% outputImg = copyPixel(images{1}, images{2}, destPointsXY, sourcePointsXY);
outputImg = blending(destImg, sourceImg, destPointsXY, sourcePointsXY);


end

