AD1 = GLCM2D('1.mat',10);
AD1Derivations = cell(120, 1);
for i=1:120
    AD1Derivations{i} =  derivations(AD1.GLCM2dDist{i}, 256);
end



%Distance 1 til 10 for X 0 til 135 grader
A = zeros(40,1);
for i=1:10
    A(i)    = AD1Derivations{1+(12*(i-1))}.my_asm;
    A(10+i) = AD1Derivations{2+(12*(i-1))}.my_asm;
    A(20+i) = AD1Derivations{3+(12*(i-1))}.my_asm;
    A(30+i) = AD1Derivations{4+(12*(i-1))}.my_asm;
end
subplot(3,1,1)
plot(A);
title('X step 1-10 degree 0-135')


%Distance 1 til 10 for Y 0 til 135 grader
A = zeros(40,1);
for i=1:10
    A(i)    = AD1Derivations{5+(12*(i-1))}.my_asm;
    A(10+i) = AD1Derivations{6+(12*(i-1))}.my_asm;
    A(20+i) = AD1Derivations{7+(12*(i-1))}.my_asm;
    A(30+i) = AD1Derivations{8+(12*(i-1))}.my_asm;
end
subplot(3,1,2)
plot(A);
title('y step 1-10 degree 0-135')

A = zeros(40,1);
for i=1:10
    A(i)    = AD1Derivations{9+(12*(i-1))}.my_asm;
    A(10+i) = AD1Derivations{10+(12*(i-1))}.my_asm;
    A(20+i) = AD1Derivations{11+(12*(i-1))}.my_asm;
    A(30+i) = AD1Derivations{12+(12*(i-1))}.my_asm;
end
subplot(3,1,3)
plot(A);
title('z step 1-10 degree 0-135')






%figure(1);
% angle0(angle0 == 0) = NaN;
%imgwhatevs = surf(GLCM2dDist1{1});
% figure(2);
% angle45(angle45 == 0) = NaN;
% imgwhatevs1 = surf(angle45);
% figure(3);
% angle90(angle90 == 0) = NaN;
% imgwhatevs2 = surf(angle90);
% figure(4);
% angle135(angle135 == 0) = NaN;
% imgwhatevs3 = surf(angle135);

%imgwhatevs = surf(glcm);

%
%Timeplan
%3D Image Texture Analysis
%Machine Learning
%Machine Learning 3D
%Forskel i slicing på 2D - Kun hvis tid

% 

%img2D = imagesc(imfuse(mri(:,:,150),segmentation(:,:,150),'blend'));

% 
 %img2D2 = imagesc(mri(:,:,160));
 
% colormap gray;

% 
% [temp1, temp2, temp3] = mri(100,:,:);
% 
% S = permute(mri, [2 3 1]);
% 
% img2D2 = imagesc(S(:,:,150));


%Finder værdier


