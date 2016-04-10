test1 = LeftHippoMatrix('2.mat');

grayScaleLevels = 256;
glcm = zeros(grayScaleLevels,grayScaleLevels);
offset = [0 1; -1 1; -1 0; -1 -1];
warning('off','all')
for i = 1:size(test1,3);
     [tmp, tmp1] = graycomatrix(test1(:,:,i),'Offset', [0 1], 'NumLevels',grayScaleLevels,'GrayLimits',[]);
     glcm = glcm + tmp;
     [tmp, tmp1] = graycomatrix(test1(:,:,i),'Offset', [-1 1], 'NumLevels',grayScaleLevels,'GrayLimits',[]);
     glcm = glcm + tmp;
     [tmp, tmp1] = graycomatrix(test1(:,:,i),'Offset', [-1 0], 'NumLevels',grayScaleLevels,'GrayLimits',[]);
     glcm = glcm + tmp;
     [tmp, tmp1] = graycomatrix(test1(:,:,i),'Offset', [-1 -1], 'NumLevels',grayScaleLevels,'GrayLimits',[]);
     glcm = glcm + tmp;
end

% glcm1 = zeros(grayScaleLevels,grayScaleLevels);
% for i = 1:size(test1,3);
%      [tmp, tmp1] = graycomatrix(test1(:,:,i),'Offset', [-1 0], 'NumLevels',grayScaleLevels,'GrayLimits',[]);
%      glcm1 = glcm1 + tmp;
% end
warning('on','all')
glcm(glcm == 0) = NaN;
imgwhatevs = surf(glcm);

%
%Timeplan
%3D Image Texture Analysis
%Machine Learning
%Machine Learning 3D
%Forskel i slicing p� 2D - Kun hvis tid

% 
% img2D = imagesc(imfuse(mri(:,:,160),segmentation(:,:,160),'blend'));
% 
% img2D2 = imagesc(mri(:,160,:), 1,3);
% 
% [temp1, temp2, temp3] = mri(100,:,:);
% 
% S = permute(mri, [2 3 1]);
% 
% img2D2 = imagesc(S(:,:,150));


