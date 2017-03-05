function [fiducialPoints ] = findFiducialPoints( image, faceDetector)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if strcmp(faceDetector.name, 'Zhu')
    image = im2double(image);
	bs = detect(image, faceDetector.model, faceDetector.model.thresh);
	bs = clipboxes(image, bs);
	bs = nms_face(bs,0.3);
	fiducialPoints = [(bs.xy(:, 1) + bs.xy(:, 3)) / 2, (bs.xy(:, 2) + bs.xy(:, 4)) / 2];
else
	%% Execute Python Code
    filePath = './forDLib.jpg';
    imwrite(image, filePath);
	Command = ['python ', faceDetector.codePath, ' ', faceDetector.predictorPath, ' ', filePath];
	[status, cmdout] = system(Command);
	
	%% Parse Outputs
	% Parse the console output and prettify it - please do not modify this code
	faceData = ParseInputs(cmdout);
	fiducialPoints = faceData.LandMarks;
end

end

