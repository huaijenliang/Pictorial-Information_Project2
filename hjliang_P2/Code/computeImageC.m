function [ imageC ] = computeImageC( points, triIndex, M )
%UNTITLED5 Summary of this function goes here
%   points: (h * w) x 3

triM = M(:, :, triIndex);
p = reshape(points', 3, 1, []);
imageC = mulAlong3Dim(triM, p);
imageC = reshape(imageC, 3, []);
imageC = imageC'; % (h * w) x 3

% normalize
imageC = imageC ./ repmat(imageC(:, 3), 1, 3);

end

