addpath(genpath('.'));

clc
clear all
close all

initialFaceDetector;

%% Setup Paths
% Specify full image name here
% You can replace this part using a loop and dir in Matlab to handle
% multiple images
ImagePath = 'images/';
files = dir(strcat(ImagePath, '*.jpg'));
imagesNum = length(files);
images = cell(1, imagesNum);
bs = cell(1, imagesNum);
for i = 1:imagesNum
    fileName = strcat(ImagePath, files(i).name);
    images{i} = imread(fileName);
%     images{i} = im2double(images{i});
    bs{i} = detect(images{i}, model, model.thresh);
    bs{i} = clipboxes(images{i}, bs{i});
    bs{i} = nms_face(bs{i},0.3);
    figure,showboxes(images{i}, bs{i},posemap),title('All detections above the threshold');
end

% show highest scoring one
% figure,showboxes(im, bs(1),posemap),title('Highest scoring detection');
% show all
% figure,showboxes(im, bs,posemap),title('All detections above the threshold');

% fprintf('Detection took %.1f seconds\n',dettime);