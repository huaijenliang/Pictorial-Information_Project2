clc
clear all
close all


if strcmp(faceDetector, 'Zhu')
	%% Compile Mex files as needed - need to do it once!
	% Uncomment this line for the first time!
	% compile;
	
	%% load and optionally visualize model
	% Pre-trained model with 146 parts. Works best for faces larger than 80*80
	load face_p146_small.mat
	
	% Pre-trained model with 99 parts. Works best for faces larger than 150*150
	% load face_p99.mat
	
	% Pre-trained model with 1050 parts. Give best performance on localization, but very slow
	% load multipie_independent.mat
	
	% Uncomment the following lines to visualize the model!
	% disp('Model visualization');
	% visualizemodel(model,1:13);
	% disp('press any key to continue');
	% pause;
	
	
	% 5 levels for each octave
	model.interval = 5;
	% set up the threshold
	model.thresh = min(-0.65, model.thresh);
	
	% define the mapping from view-specific mixture id to viewpoint
	if length(model.components)==13
	    posemap = 90:-15:-90;
	elseif length(model.components)==18
	    posemap = [90:-15:15 0 0 0 0 0 0 -15:-15:-90];
	else
	    error('Can not recognize this model');
	end
else
	%% Setup Paths
	CodePath = './FaceLandmarksNitin.py';
	PredictorPath = 'shape_predictor_68_face_landmarks.dat';
	FacesPath = '../examples/faces2/Nitin.jpg';
	
	%% Execute Python Code
	Command = ['python ', CodePath, ' ', PredictorPath, ' ', FacesPath];
	[status, cmdout] = system(Command);
	
	%% Parse Outputs
	I = imread(FacesPath);
	imshow(I);
	
	% Parse the console output and prettify it - please do not modify this code
	FaceData = ParseInputs(cmdout);
end
