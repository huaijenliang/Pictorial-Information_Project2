function [ outputImg ] = myWrapper( destImg, sourceImg, faceDetector, wrapMethod )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[~, fiducialPoints{1}] = findFiducialPoints(destImg, faceDetector);
[~, fiducialPoints{2}] = findFiducialPoints(sourceImg, faceDetector);
if strcmp(wrapMethod, 'tri')
    outputImg = triWarp(destImg, sourceImg, fiducialPoints);
else
    outputImg = TPSWarp(destImg, sourceImg, fiducialPoints);
end

end

