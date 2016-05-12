kage = glcm2dNew('12.mat',1);

A = kage{1};
test1 = sum(sum(A));
test2 = sum(A(:));
[data_Derivations] = dataexection(1,2);