function [ outputImg ] = myWrapper( destImg, sourceImg, faceDetector, wrapMethod )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
outputImg = [];
destImg = double(destImg);
sourceImg = double(sourceImg);
[fiducialPoints{1}] = findFiducialPoints(destImg, faceDetector);
[fiducialPoints{2}] = findFiducialPoints(sourceImg, faceDetector);
if (isempty(fiducialPoints{1}) || isempty(fiducialPoints{2}))
    return;
end
if strcmp(wrapMethod, 'tri')
    outputImg = triWarp(destImg, sourceImg, fiducialPoints);
else
    outputImg = TPSWarp(destImg, sourceImg, fiducialPoints);
end
outputImg = im2double(uint8(outputImg));
end

