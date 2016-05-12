kage = glcm2dFast('12.mat',1);
A = kage{1};
test1 = derivationsTest(A,256);
test2 = GLCM_Features1Test(A);