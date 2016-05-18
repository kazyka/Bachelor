function [] = Untitled3( input_args )

A = input_args;
[x,y,z] = ndgrid(1:size(A, 1), 1:size(A, 2), 1:size(A, 3));
xx = x(A == 1); %keep only coordinates for A == 1 
yy = y(A == 1); %these 3 lines also reshape the 3d array
zz = z(A == 1); %into column vectors
plot3(xx, yy, zz, '*');
end

