function [xi,yi] = refinePeaks(idx,x,y)
% REFINEPEAKS refine local minima / maxima by fitting cubic splines
%   [xi,yi] = refinePeaks(idx,x,y)
%   Inputs:
%       - idx: Index of local maxima or minima in the signal defined by x
%       and y.
%       - x: x axis of signal
%       - y: y axis of signal
%   Outputs:
%       - xi: minima/maxima locations on x axis
%       - yi: minima/maxima amplitudes
%
%   author: Fintan Healy    email:fintan.healy@bristol.ac.uk
%   date: 12/11/2024



% estimation matrix, values of a,b,c (y = ax^2+bx+c) at x = -1,0,1
% ms = [1 -1 1;0 0 1;1 1 1];
% pre-allocate arrays
if isempty(idx)
    [~,idx] = max(y);
end

yi = y(idx);
xi = x(idx);
%iterate over peaks
for i = 1:length(idx)
    if idx(i)>1 && idx(i)<length(x)
        xs = x(idx(i)-1:idx(i)+1);
        ps = [xs.^2;xs;1 1 1]'\y(idx(i)-1:idx(i)+1)';
        xi(i) = -ps(2)/(2*ps(1));
        yi(i) = ps(1)*xi(i)^2+ps(2)*xi(i)+ps(3);
    end
end

end