function [ writerObj ] = createVideo( images, framesNum, framesRate, fileName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% create the video writer with 1 fps
writerObj = VideoWriter(fileName);
writerObj.FrameRate = framesRate;
% open the video writer
open(writerObj);
% write the frames to the video
newImages = resizeImages(images);
for i = 1:length(newImages)
    % convert the image to a frame
    frame = im2frame(newImages{i});
    for f = 1:framesNum 
        writeVideo(writerObj, frame);
    end
end
% close the writer object
close(writerObj);

end

function [ newImages ] = resizeImages( images )
[nRows, nCols, ~] = cellfun(@size, images);
newNRows = min(nRows);
newNCols = min(nCols);
newImages = cellfun(@(x) imresize(x, [newNRows, newNCols]), images, 'UniformOutput', false);
end

