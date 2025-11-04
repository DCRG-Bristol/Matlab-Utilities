function G = Jones(y,Factor)
    %Jones - return Jones lift distribution at normalised points y
    % args - 
    %   y - normalised spanwise locations (0 to 1)
    %   Factor - Jones factor (default 1) 1 targets ellipse
    arguments
        y double
        Factor (1,1) double = 1
    end
    a = (1-4*Factor/(3*pi))/(2*(1-4/(3*pi)));
    b = Factor/2-a;
    G = 2*(a+b/pi).*sqrt(1-y.^2) + 2*b./pi.*y.^2.*acosh(1./abs(y));
    G(y==0) = 2*(a+b/pi);
end