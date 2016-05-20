kage = glcm2dFast(LeftHippoMatrix('12.mat','erode'),1);

s = size(kage,1);
test = zeros(s,s);
testT = zeros(s,s);
for i= 1:s
    for j = 1:s
        test(i,j) = isequal(kage{i},kage{j});
        testT(i,j) = isequal(kage{i},transpose(kage{j}));
    end
end
