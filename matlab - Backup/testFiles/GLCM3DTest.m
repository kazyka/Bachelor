DataBox = LeftHippoMatrix('12.mat');
test = GLCM3D(DataBox,10);
A = zeros(130,1);
for i = 1:130
    A(i) = sum(sum(test{i}));
end
