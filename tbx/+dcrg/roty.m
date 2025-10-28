function [mat] = roty(angle)
%ROTX Summary of this function goes here
%   Detailed explanation goes here
N = numel(angle);
mat = repmat(eye(3),1,1,N);
mat(1,1,:) = cos(angle);
mat(3,3,:) = mat(1,1,:);
mat(1,3,:) = sin(angle);
mat(3,1,:) = -sin(angle);
end

