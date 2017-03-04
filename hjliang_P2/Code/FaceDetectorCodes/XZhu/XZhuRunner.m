%% Wrapper to run X. Zhu's face landmark detector code from
% https://www.ics.uci.edu/~xzhu/face/
% Code modified by: Nitin J. Sanket, PhD in Computer Science Student,
% University of Maryland, College Park

clc
clear all
close all

%% Setup Paths
% Specify full image name here
% You can replace this part using a loop and dir in Matlab to handle
% multiple images
ImagePath = 'images/1.jpg';

%% Compile Mex files as needed - need to do it once!
% Uncomment this line for the first time!
compile;

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


im = imread(ImagePath);
% clf; imagesc(im); axis image; axis off; drawnow;

tic;
bs = detect(im, model, model.thresh);
bs = clipboxes(im, bs);
bs = nms_face(bs,0.3);
dettime = toc;

% show highest scoring one
% figure,showboxes(im, bs(1),posemap),title('Highest scoring detection');
% show all
figure,showboxes(im, bs,posemap),title('All detections above the threshold');

fprintf('Detection took %.1f seconds\n',dettime);
