function [ outputImg ] = myWrapper( destImg, sourceImg, faceDetector, wrapMethod )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
outputImg = [];
destImg = double(destImg);
sourceImg = double(sourceImg);
fiducialPointsCell = findFiducialPoints(destImg, faceDetector);
if (isempty(fiducialPointsCell))
    disp('Cannot find any face in the destination image.');
    return;
end
fiducialPoints{1} = fiducialPointsCell{1};

fiducialPointsCell = findFiducialPoints(sourceImg, faceDetector);
if (isempty(fiducialPointsCell))
    disp('Cannot find any face in the source image.');
    return;
end
fiducialPoints{2} = fiducialPointsCell{1};

if strcmp(wrapMethod, 'tri')
    outputImg = triWarp(destImg, sourceImg, fiducialPoints);
else
    outputImg = TPSWarp(destImg, sourceImg, fiducialPoints);
end
outputImg = im2double(outputImg);
end

