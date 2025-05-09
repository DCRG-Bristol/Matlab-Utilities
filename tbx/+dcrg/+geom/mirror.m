function out = mirror(n)
% matrix to mirror points about plane with normal n
arguments
    n (3,1) double
end
out = eye(3)-2*(n*n');
end