addpath(genpath('.'));

% clc
% clear all
% close all

model = 0;
faceDetector.name = 'Zhu';
initialFaceDetector;

%% Setup Paths
% Specify full image name here
% You can replace this part using a loop and dir in Matlab to handle
% multiple images
ImagePath = 'images/';
files = dir(strcat(ImagePath, '*.jpg'));
% imageName = [files(1).name; files(2).name]
imagesName = {'images/2.jpg'; 'images/1.jpg'; 'images/swap.jpg'};
imagesNum = 3;% length(files);
images = cell(1, imagesNum);
bs = cell(1, imagesNum);
fiducialPoints = cell(1, imagesNum);
tri = cell(1, imagesNum);
% 1: dest, 2: source
for i = 1:imagesNum
    fileName = imagesName{i};%strcat(ImagePath, files(i).name);
    images{i} = imread(fileName);
%     images{i} = im2double(images{i});
%     [fiducialPoints{i}] = findFiducialPoints(images{i}, faceDetector);
%     if i == 1
%         tri{i} = delaunay(fiducialPoints{i}(:, 1), fiducialPoints{i}(:, 2));
%     else
%         tri{i} = tri{1};
%     end
%     figure
%     % showboxes(images{i}, bs{i},posemap)
%     imagesc(images{i})
%     title('All detections above the threshold');
%     hold on
%     triplot(tri{i}, fiducialPoints{i}(:, 1), fiducialPoints{i}(:, 2), 'r-')
%     plot(fiducialPoints{i}(:, 1), fiducialPoints{i}(:, 2), 'b*')
%     hold off
end

outputImg.tri = myWrapper(images{1}, images{2}, faceDetector, 'tri');
outputImg.TPS = myWrapper(images{1}, images{2}, faceDetector, 'TPS');

% outputImg.tri = myWrapperForSwap(images{3}, faceDetector, 'tri');
% outputImg.TPS = myWrapperForSwap(images{3}, faceDetector, 'TPS');

figure
set(gca,'position',[0 0 1 1],'units','normalized')
subplot(1, 2, 1)
imagesc(outputImg.tri)

subplot(1, 2, 2)
imagesc(outputImg.TPS)

% show highest scoring one
% figure,showboxes(im, bs(1),posemap),title('Highest scoring detection');
% show all
% figure,showboxes(im, bs,posemap),title('All detections above the threshold');

% fprintf('Detection took %.1f seconds\n',dettime);