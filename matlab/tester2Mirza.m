hippoBox = HippoMatrix('1.mat', 'erode', 'left');

[glcm2dx,glcm2dy,glcm2dz] = glcm2DallAngles(hippoBox, 1);
glcm2d = glcm2dFast(hippoBox, 10);

glcm = glcm2dx(:,:,1);

glcm = glcm./sum(glcm(:));
