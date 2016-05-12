test = GLCM2D('1.mat',10);
test2 = GLCMFeatures(test.GLCM2dDist{1,1});
mat = graycoprops(test.GLCM2dDist{1,1},{'contrast','homogeneity','Energy','Correlation'});
test3 = derivations(test.GLCM2dDist{1,1}, 256);

m = [1 2; 3 4];


tic; m = m./sum(m(:)); toc
tic; custtmp = bsxfun(@rdivide,m,sum(sum(m))); toc

m = rand(100,100);

for i = 1:100

tic; m = m./sum(m(:)); toc; %Matlab bruger denne metode
% bsxfun er hurtigere med 2500%
tmp1(i) = toc;
tic; m = m./sum(sum(m)); toc;
tmp2(i) = toc;
end


figure;
hold on;
plot(tmp1, 'g')
plot(tmp2)
hold off;


% open graycoprops