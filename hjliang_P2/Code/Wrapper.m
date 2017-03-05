function [ output_args ] = Wrapper( )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

addpath(genpath('.'));

clc
clear all
close all

swapFace = 1;
wrapMethod = 'tri';
faceDetector.name = 'DLib';
initialFaceDetector;

%% Setup Paths
% Specify full image name here
% You can replace this part using a loop and dir in Matlab to handle
% multiple images
videoPath = '../Videos/Video1/1.avi';
videoExt = videoPath((end - 3):end);
images = readVideo(videoPath);
imagesNum = length(images);
outputImg = cell(1, imagesNum);
% imagesName = {'test.jpg'; 'images/1.jpg'};
% imagesNum = length(imagesName);
% images = cell(1, imagesNum);
% 1: dest, 2: source
sourceImg = imread('images/handsome.jpg');
count = 0;
for i = 1:imagesNum
    if swapFace
        outputImg{count + 1} = myWrapper(images{i}, faceDetector, wrapMethod);
    else
        outputImg{count + 1} = myWrapper(images{i}, sourceImg, faceDetector, wrapMethod);
    end
    if isempty(outputImg{count})
        continue;
    end
    count = count + 1;
end

createVideo(outputImg(1:count), 1, 10, strcat(videoPath(1:(end - 4)), 'Out', videoExt));

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

