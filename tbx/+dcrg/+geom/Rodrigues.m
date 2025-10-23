function A = Rodrigues(v,angle)
%RODRIGUES Reurns the rotation matix assiated with the vector omega
%   omega is a vector whos direction refines the axis of rotation and who
%   magnitude defines the magnitude of rotation (in radians)
if angle == 0
    A = repmat(eye(3),1,1,size(v,3));
else
    n = v./vecnorm(v);
    W = dcrg.geom.Wedge(n);
    if size(v,3)==1
        A = eye(3)+ W*sin(angle) + W*W*(1-cos(angle));
    else
        if size(v,3)~=size(angle,3)
            error("pages of v and angle must be of same length")
        end
        A = repmat(eye(3),1,1,size(v,3));
        A = A + pagemtimes(W,sin(angle)) + pagemtimes(pagemtimes(W,W),(1-cos(angle)));
    end
end
end

