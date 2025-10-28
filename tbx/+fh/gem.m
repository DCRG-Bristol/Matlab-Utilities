function [v,fwt_rot_m] = gem(fold,u,root_aoa,beta,flare,sweep,dihedral,hinge_setting_angle)
    if ~exist('hinge_setting_angle','var')
        hinge_setting_angle = 0;
    end
    wing_rot_m = dcrg.rotyd(root_aoa)*dcrg.rotzd(beta)*dcrg.rotxd(dihedral);
    hinge_rot_m = wing_rot_m*...
        dcrg.rotzd(-flare)*...
        dcrg.rotyd(hinge_setting_angle);
    v = zeros(3,size(fold,2));
    for i = 1:size(fold,2)
        fwt_rot_m = hinge_rot_m*...
        dcrg.rotxd(fold(i))*...
        dcrg.rotyd(-hinge_setting_angle)*...
        dcrg.rotzd(flare-sweep);
        v(:,i) = fwt_rot_m'*[u;0;0];
    end
end

