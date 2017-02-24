function [ output_args ] = triWarp( images, fiducialPoints )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

destImgSize = imsize(images{1});
% triangulation
destTri= delaunay(fiducialPoints{1}(:, 1), fiducialPoints{1}(:, 2));

% find corresponding triangle's index for each points
[pointsX, pointsY] = meshgrid(1:destImgSize(2), 1:destImgSize(1));
pointsXY = [pointsX(:), pointsY(:)];
tIndex = tsearchn(fiducialPoints{1}, destTri, pointsXY);

end

