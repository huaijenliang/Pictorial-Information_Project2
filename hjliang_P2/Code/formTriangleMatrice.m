function [ m ] = formTriangleMatrice( XY, tri )
%UNTITLED Summary of this function goes here
%   XY  :
%   tri : triNum x 3
% triNum = size(tri, 1);
triTemp = tri';
m = XY(triTemp, :); % (triNum * 3) x 2
m = [m, ones(size(m, 1), 1)]; % homogeneous
m = m';
m = reshape(m, 3, 3, []); % 3 x 3 x triNum

end

