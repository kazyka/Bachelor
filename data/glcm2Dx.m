function [angle0x,angle45x,angle90x,angle135x] = glcm2Dx(data, d)
angle0x = zeros(256,256);
angle45x = zeros(256,256);
angle90x = zeros(256,256);
angle135x = zeros(256,256);
warning('off','all')
for i = 1:size(data,1);
     tmp= graycomatrix(squeeze(data(i,:,:)),'Offset', [0 d],'NumLevels', 256,'GrayLimits',[]);
     angle0x = angle0x + tmp;
     tmp1 = graycomatrix(squeeze(data(i,:,:)),'Offset', [-d d],'NumLevels', 256,'GrayLimits',[]);
     angle45x = angle45x + tmp1;
     tmp2 = graycomatrix(squeeze(data(i,:,:)),'Offset', [-d 0],'NumLevels', 256,'GrayLimits',[]);
     angle90x = angle90x + tmp2;
     tmp3 = graycomatrix(squeeze(data(i,:,:)),'Offset', [-d -d],'NumLevels', 256,'GrayLimits',[]);
     angle135x = angle135x + tmp3;
end
warning('on','all')
end