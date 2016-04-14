load('2.mat');
grayScaleLevels = 256;
test1 = LeftHippoMatrix('2.mat');
[angle0x, angle45x, angle90x, angle135x] = glcm2Dx(test1,1);
[angle0y, angle45y, angle90y, angle135y] = glcm2Dy(test1,1);
[angle0z, angle45z, angle90z, angle135z] = glcm2Dz(test1,1);
GLCM2dDist1 = cell(12,1);
GLCM2dDist1{1} = angle0x;
GLCM2dDist1{2} = angle45x;
GLCM2dDist1{3} = angle90x;
GLCM2dDist1{4} = angle135x;
GLCM2dDist1{5} = angle0y;
GLCM2dDist1{6} = angle45y;
GLCM2dDist1{7} = angle90y;
GLCM2dDist1{8} = angle135y;
GLCM2dDist1{9} = angle0z;
GLCM2dDist1{10} = angle45z;
GLCM2dDist1{11} = angle90z;
GLCM2dDist1{12} = angle135z;

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

% i = 1;
% j = 1;
% Ci_y = 0;
% for i = 1:grayScaleLevels
%     Ci_y = Ci_y + glcm(i, j);
% end
% 
% i = 1;
% j = 1;
% Ci_x = 0;
% for j = 1:grayScaleLevels
%     Ci_x = Ci_x + glcm(i, j);
% end
% 
% 
% Cxy = sum(nansum(glcm));
% 
% i = 1;
% j = 1;
% energy = 0;
% for  i = 1:grayScaleLevels
%     for j = 1:grayScaleLevels
%         energy = energy + glcm(i, j)^2;
%     end
% end
% 
% correlation = corr(corr(glcm));
% 
% % i = 1;
% % j = 1;
% % entropy = 0;
% % for  i = 1:grayScaleLevels
% %     for j = 1:6
% %         entropy = entropy + glcm(i, j) * log(glcm(i,j));
% %     end
% % end
% % entropy = -entropy;
% 
% entropy = -sum(glcm(find(glcm)) .* log(glcm(find(glcm))));
% 
% i = 1;
% j = 1;
% contrast = 0;
% for  i = 1:grayScaleLevels
%     for j = 1:grayScaleLevels
%         contrast = contrast +(glcm(i)-glcm(j))^2*glcm(i, j);
%     end
% end
% 
% i = 1;
% j = 1;
% variance = 0;
% for  i = 1:grayScaleLevels
%     for j = 1:grayScaleLevels
%         variance = (glcm(i) - mean(mean(glcm)))^2* glcm(i, j);
%     end
% end









