function [image, fiducialPoints ] = findFiducialPoints( filePath, model, faceDetector)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
image = imread(filePath);
if strcmp(faceDetector.name, 'Zhu')
	bs = detect(image, model, model.thresh);
	bs = clipboxes(image, bs);
	bs = nms_face(bs,0.3);
	fiducialPoints = [(bs.xy(:, 1) + bs.xy(:, 3)) / 2, (bs.xy(:, 2) + bs.xy(:, 4)) / 2];
else
	%% Execute Python Code
	Command = ['python ', faceDetector.codePath, ' ', faceDetector.predictorPath, ' ', filePath];
	[status, cmdout] = system(Command);
	
	%% Parse Outputs
	% Parse the console output and prettify it - please do not modify this code
	faceData = ParseInputs(cmdout);
	fiducialPoints = faceData.LandMarks;
end

end

