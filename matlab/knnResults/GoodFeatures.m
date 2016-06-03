
debug = HippoMatrix('32.mat', 'erode', 'right');
%debug2d = glcm2dFast(debug,10);
debug3d = GLCM3D(debug, 10);

GLCMDerivations(debug, 'normal');
hu = (nansum(nansum(debug)));

t1 = debug(:,:,1);
t2 = debug(:,:,2);
t3 = isnan(debug(14,6,3));

load('6.mat');
t4 = squeeze(max(mri));


d = 1;
offsets = [0 d; -d d;-d 0;-d -d];
tmp0 = graycomatrix(squeeze(debug(15,:,:)),'Offset', offsets,'NumLevels', 256, 'GrayLimits', [1 256]);