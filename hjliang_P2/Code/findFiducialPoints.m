function [ fiducialPoints ] = findFiducialPoints( image, model, faceData )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if strcmp(faceDetector, 'Zhu')
	bs = detect(image, model, model.thresh);
	bs = clipboxes(image, bs);
	bs = nms_face(bs,0.3);
	fiducialPoints = [(bs.xy(:, 1) + bs.xy(:, 3)) / 2, (bs.xy(:, 2) + bs.xy(:, 4)) / 2];
else
	fiducialPoints = faceData.LandMark;
end

end

