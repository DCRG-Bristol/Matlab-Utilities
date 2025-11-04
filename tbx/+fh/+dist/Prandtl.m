function G = Prandtl(y,Factor)
    %Prandtl - return Prandtl lift distribution at normalised points y
    % args - 
    %   y - normalised spanwise locations (0 to 1)
    %   Factor - Prandtl factor (default 0) 0 targets ellipse, 1 bell
    arguments
        y double
        Factor (1,1) double = 0
    end
    G = ((1-Factor.*y.^2).*sqrt(1-y.^2));
end