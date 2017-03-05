function [ outputImg ] = myWrapperForSwap( image, faceDetector, wrapMethod )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
outputImg = [];
image = double(image);
[fiducialPointsCell] = findFiducialPoints(image, faceDetector);
if (length(fiducialPointsCell) < 2)
    disp('Cannot not find more than two faces');
    return;
end

fiducialPoints{1} = fiducialPointsCell{1};
fiducialPoints{2} = fiducialPointsCell{2};
 
if strcmp(wrapMethod, 'tri')
    outputImg = double(uint8(triWarp(image, image, fiducialPoints)));
    outputImg = triWarp(outputImg, image, fiducialPoints([2, 1]));
else
    outputImg = double(uint8(TPSWarp(image, image, fiducialPoints)));
    outputImg = TPSWarp(outputImg, image, fiducialPoints([2, 1]));
end
outputImg = im2double(uint8(outputImg));
end

