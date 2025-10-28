function [mat] = rotx(angle)
%ROTX Summary of this function goes here
%   Detailed explanation goes here
if isscalar(angle)
    if angle == 0
        mat = eye(3);
        return;
    elseif angle == pi || angle == -3*pi/2
        c = 0;
        s = 1;
    elseif angle == -pi/2 || angle == 3*pi/2
        c  = 0;
        s = -1;
    elseif abs(angle) == pi
        c = -1;
        s = 0;
    else
        c = cos(angle);
        s = sin(angle);
    end
    mat = [1,0,0;0,c,-s;0,s,c];
else
    mat = repmat(eye(3),1,1,numel(angle));
    c = cos(angle);
    s = sin(angle);
    mat(2,2,:) = c;
    mat(2,3,:) = -s;
    mat(3,2,:) = s;
    mat(3,3,:) = c;
end
end

