function [ outputImg ] = myWrapper( destImg, sourceImg, faceDetector, wrapMethod )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
outputImg = [];
destImg = double(destImg);
sourceImg = double(sourceImg);
fiducialPointsCell = findFiducialPoints(destImg, faceDetector);
fiducialPoints{1} = fiducialPointsCell{1};
fiducialPointsCell = findFiducialPoints(sourceImg, faceDetector);
fiducialPoints{2} = fiducialPointsCell{1};

if (isempty(fiducialPoints{1}) || isempty(fiducialPoints{2}))
    disp('Cannot find any face');
    return;
end
if strcmp(wrapMethod, 'tri')
    outputImg = triWarp(destImg, sourceImg, fiducialPoints);
else
    outputImg = TPSWarp(destImg, sourceImg, fiducialPoints);
end
outputImg = im2double(outputImg);
end

