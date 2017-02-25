function [ outputImg ] = copyPixel( destImg, sourceImg, destXY, sourceXY )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

outputImg = destImg;
[destR, destC, channels] = size(destImg);
[sourceR, sourceC, ~] = size(sourceImg);
destIndex = sub2ind([destR, destC], destXY(:, 2), destXY(:, 1));
sourceIndex = sub2ind([sourceR, sourceC], sourceXY(:, 2), sourceXY(:, 1));

[x, y] = meshgrid(1:sourceC, 1:sourceR);

for c = 1:channels
    dest = outputImg(:, :, c);
    source = sourceImg(:, :, c);
    % dest(destIndex) = source(sourceIndex);
    dest(destIndex) = interp2(x, y, source, sourceXY(:, 1), sourceXY(:, 2));
    outputImg(:, :, c) = dest;
end

end

