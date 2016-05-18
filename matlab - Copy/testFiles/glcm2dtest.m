test1 = GLCM2D('1.mat',10);
test2 = glcm2dNew('1.mat',10);
A = zeros(120,1);
for i=1:120
    A(i) = isequal(test2{i},test1.GLCM2dDist{i});
end