function [angle0z,angle45z,angle90z,angle135z] = glcm2Dz(data, d)
angle0z = zeros(256,256);
angle45z = zeros(256,256);
angle90z = zeros(256,256);
angle135z = zeros(256,256);
warning('off','all')
for i = 1:size(data,3);
     tmp = graycomatrix(data(:,:,i),'Offset', [0 d],'NumLevels', 256,'GrayLimits',[]);
     angle0z = angle0z + tmp;
     tmp1 = graycomatrix(data(:,:,i),'Offset', [-d d],'NumLevels', 256,'GrayLimits',[]);
     angle45z = angle45z + tmp1;
     tmp2 = graycomatrix(data(:,:,i),'Offset', [-d 0],'NumLevels', 256,'GrayLimits',[]);
     angle90z = angle90z + tmp2;
     tmp3 = graycomatrix(data(:,:,i),'Offset', [-d -d],'NumLevels', 256,'GrayLimits',[]);
     angle135z = angle135z + tmp3;
end
warning('on','all')
end