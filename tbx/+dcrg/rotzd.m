function [mat] = rotz(angle)
%ROTX Summary of this function goes here
%   Detailed explanation goes here
if isscalar(angle)
    if angle == 0
        mat = eye(3);
        return;
    elseif angle == 90 || angle == -270
        c = 0;
        s = 1;
    elseif angle == -90 || angle == 270
        c  = 0;
        s = -1;
    elseif abs(angle) == 180
        c = -1;
        s = 0;
    else
        c = cosd(angle);
        s = sind(angle);
    end
    mat = [c,-s,0;s,c,0;0,0,1];
else
    mat = repmat(eye(3),1,1,numel(angle));
    c = cosd(angle);
    s = sind(angle);
    mat(1,1,:) = c;
    mat(1,2,:) = -s;
    mat(2,1,:) = s;
    mat(2,2,:) = c;
end
end

