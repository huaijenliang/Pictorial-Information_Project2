function [ outputImg ] = copyPixel( destImg, sourceImg, destXY, sourceXY )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

outputImg = destImg;
[destR, destC, channels] = size(destImg);
[sourceR, sourceC, ~] = size(sourceImg);
destIndex = sub2ind([destR, destC], destXY(:, 1), destXY(:, 2));
sourceIndex = sub2ind([sourceR, sourceC], sourceXY(:, 1), sourceXY(:, 2));

for c = 1:channels
    dest = outputImg(:, :, c);
    source = sourceImg(:, :, c);
    dest(destIndex) = source(sourceIndex);
    outputImg(:, :, c) = dest;
end

end

