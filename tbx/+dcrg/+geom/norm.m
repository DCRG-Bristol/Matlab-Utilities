function [out,scale] = norm(v)
scale = vecnorm(v);
out = v./scale;
end

