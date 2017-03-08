function [ video, images ] = readVideo( fileName )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

video = VideoReader(fileName);
cellStepSize = 100;
images  = cell(cellStepSize, 1);
imagesSize = cellStepSize;
imagesIndex = 0;

while hasFrame(video)
    imagesIndex = imagesIndex + 1;
    if imagesIndex > imagesSize
        [images, imagesSize] = expandCell(images, cellStepSize);
    end
    images{imagesIndex} = readFrame(video);
end

images = images(1:imagesIndex);

end

function [ newImages, newSize ] = expandCell(images, addSize)
oldSize = length(images);
newSize = oldSize + addSize;
newImages = cell(newSize, 1);
newImages(1:oldSize) = images;
end

