function [ output_args ] = Wrapper( )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

addpath(genpath('.'));

clc
clear all
close all

swapFace = 0;
wrapMethod = 'tri';
faceDetector.name = 'DLib';
initialFaceDetector;
interPolateNum = 1;

%% Setup Paths
% Specify full image name here
% You can replace this part using a loop and dir in Matlab to handle
% multiple images
% videoPath = '../Videos/Video2/2.avi';
videoPath = '../TestSet_P2/Test1.mp4';
videoExt = videoPath((end - 3):end);
[videoFormat, images] = readVideo(videoPath);
imagesNum = length(images);
outputImg = cell(1, imagesNum * 2);
% imagesName = {'test.jpg'; 'images/1.jpg'};
% imagesNum = length(imagesName);
% images = cell(1, imagesNum);
% 1: dest, 2: source
sourceImg = imread('../TestSet_P2/Rambo.jpg');
count = 0;
smoothing = 0;
for i = 1:imagesNum
    if swapFace
        tempImg = myWrapperForSwap(images{i}, faceDetector, wrapMethod);
    else
        tempImg = myWrapper(images{i}, sourceImg, faceDetector, wrapMethod);
    end
    if isempty(tempImg)
        tempImg = im2double(images{i});
        smoothing = 0;
    % if it is not the first frame, do smoothing
    elseif smoothing
        diff = (tempImg - outputImg{count}) / (interPolateNum + 1.0);
        for j = 1:interPolateNum
            interImg = outputImg{count} + diff;
            outputImg{count + 1} = interImg;
            disp(sprintf('frame %d done (smoothing)', count + 1));
            count = count + 1;
        end
%         interImg = (outputImg{count}+ tempImg) / 2.0;
%         outputImg{count + 1} = interImg;
%         disp(sprintf('frame %d done (smoothing)', count + 1));
%         count = count + 1;
    else
        smoothing = 1;
    end
    outputImg{count + 1} = tempImg;
    disp(sprintf('frame %d done', count + 1));
    count = count + 1;
end

createVideo(outputImg(1:count), 1, count * videoFormat.FrameRate / double(imagesNum), strcat(videoPath(1:(end - 4)), 'Out'));

% outputImg.tri = myWrapper(images{1}, images{2}, faceDetector, 'tri');
% outputImg.TPS = myWrapper(images{1}, images{2}, faceDetector, 'TPS');
% 
% figure
% set(gca,'position',[0 0 1 1],'units','normalized')
% subplot(1, 2, 1)
% imagesc(outputImg.tri)
% 
% subplot(1, 2, 2)
% imagesc(outputImg.TPS)

end