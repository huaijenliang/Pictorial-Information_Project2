function [fiducialPoints ] = findFiducialPoints( image, faceDetector)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
fiducialPoints = [];
if strcmp(faceDetector.name, 'Zhu')
%     image = im2double(image);
	bs = detect(image, faceDetector.model, faceDetector.model.thresh);
	bs = clipboxes(image, bs);
	bs = nms_face(bs,0.3);
    l = length(bs);
    fiducialPoints = cell(1, l);
    for i = 1:l
        fiducialPoints{i} = round([(bs(i).xy(:, 1) + bs(i).xy(:, 3)) / 2, (bs(i).xy(:, 2) + bs(i).xy(:, 4)) / 2]);
    end
else
	%% Execute Python Code
    filePath = './forDLib.jpg';
    imwrite(uint8(image), filePath);
	Command = ['python ', faceDetector.codePath, ' ', faceDetector.predictorPath, ' ', filePath];
	[~, cmdout] = system(Command);
    
	Str = strsplit(cmdout, {'\n', ' ', '(', ')', ',',});
    NumFaces = str2double(Str{1});
    % No faces found
    if(isempty(NumFaces) || (NumFaces==0))
        return;
    end
	%% Parse Outputs
	% Parse the console output and prettify it - please do not modify this code
	faceData = ParseInputs(cmdout);
    l = length(faceData);
    fiducialPoints = cell(1, l);
    for i = 1:l
        fiducialPoints{i} = faceData(i).LandMarks;
    end
end
if ~iscell(fiducialPoints)
    fiducialPoints = {fiducialPoints};
end

end

