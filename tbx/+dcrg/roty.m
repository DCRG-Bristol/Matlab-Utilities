function [mat] = roty(angle)
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
    mat = [c,0,s;0,1,0;-s,0,c];
else
    mat = repmat(eye(3),1,1,numel(angle));
    c = cos(angle);
    s = sin(angle);
    mat(1,1,:) = c;
    mat(1,3,:) = s;
    mat(3,1,:) = -s;
    mat(3,3,:) = c;
end
end

