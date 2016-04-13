load('2.mat');
test1 = LeftHippoMatrix('2.mat');

grayScaleLevels = 8;
glcm = zeros(grayScaleLevels,grayScaleLevels);
offset = [0 1; -1 1; -1 0; -1 -1];
warning('off','all')
for i = 1:size(test1,3);
     [tmp, ~] = graycomatrix(test1(:,:,i),'Offset', [0 1], 'NumLevels',grayScaleLevels,'GrayLimits',[]);
     glcm = glcm + tmp;
     [tmp, ~] = graycomatrix(test1(:,:,i),'Offset', [-1 1], 'NumLevels',grayScaleLevels,'GrayLimits',[]);
     glcm = glcm + tmp;
     [tmp, ~] = graycomatrix(test1(:,:,i),'Offset', [-1 0], 'NumLevels',grayScaleLevels,'GrayLimits',[]);
     glcm = glcm + tmp;
     [tmp, ~] = graycomatrix(test1(:,:,i),'Offset', [-1 -1], 'NumLevels',grayScaleLevels,'GrayLimits',[]);
     glcm = glcm + tmp;
end

% glcm1 = zeros(grayScaleLevels,grayScaleLevels);
% for i = 1:size(test1,3);
%      [tmp, tmp1] = graycomatrix(test1(:,:,i),'Offset', [-1 0], 'NumLevels',grayScaleLevels,'GrayLimits',[]);
%      glcm1 = glcm1 + tmp;
% end
warning('on','all')

%glcm(glcm == 0) = NaN;


%imgwhatevs = surf(glcm);

%
%Timeplan
%3D Image Texture Analysis
%Machine Learning
%Machine Learning 3D
%Forskel i slicing på 2D - Kun hvis tid

% 

img2D = imagesc(imfuse(mri(:,:,150),segmentation(:,:,150),'blend'));

% 
 %img2D2 = imagesc(mri(:,:,160));
 
 colormap gray;

% 
% [temp1, temp2, temp3] = mri(100,:,:);
% 
% S = permute(mri, [2 3 1]);
% 
% img2D2 = imagesc(S(:,:,150));


%Finder værdier

i = 1;
j = 1;
Ci_y = 0;
for i = 1:grayScaleLevels
    Ci_y = Ci_y + glcm(i, j);
end

i = 1;
j = 1;
Ci_x = 0;
for j = 1:grayScaleLevels
    Ci_x = Ci_x + glcm(i, j);
end


Cxy = sum(nansum(glcm));

i = 1;
j = 1;
energy = 0;
for  i = 1:grayScaleLevels
    for j = 1:grayScaleLevels
        energy = energy + glcm(i, j)^2;
    end
end

correlation = corr(corr(glcm));

% i = 1;
% j = 1;
% entropy = 0;
% for  i = 1:grayScaleLevels
%     for j = 1:6
%         entropy = entropy + glcm(i, j) * log(glcm(i,j));
%     end
% end
% entropy = -entropy;

entropy = -sum(glcm(find(glcm)) .* log(glcm(find(glcm))));

i = 1;
j = 1;
contrast = 0;
for  i = 1:grayScaleLevels
    for j = 1:grayScaleLevels
        contrast = contrast +(glcm(i)-glcm(j))^2*glcm(i, j);
    end
end

i = 1;
j = 1;
variance = 0;
for  i = 1:grayScaleLevels
    for j = 1:grayScaleLevels
        variance = (glcm(i) - mean(mean(glcm)))^2* glcm(i, j);
    end
end









