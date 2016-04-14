function [angle0y,angle45y,angle90y,angle135y] = glcm2Dy(data, d)
angle0y = zeros(256,256);
angle45y = zeros(256,256);
angle90y = zeros(256,256);
angle135y = zeros(256,256);
warning('off','all')
for i = 1:size(data,2);
     tmp = graycomatrix(squeeze(data(:,i,:)),'Offset', [0 d],'NumLevels', 256,'GrayLimits',[]);
     angle0y = angle0y + tmp;
     tmp1 = graycomatrix(squeeze(data(:,i,:)),'Offset', [-d d],'NumLevels', 256,'GrayLimits',[]);
     angle45y = angle45y + tmp1;
     tmp2 = graycomatrix(squeeze(data(:,i,:)),'Offset', [-d 0],'NumLevels', 256,'GrayLimits',[]);
     angle90y = angle90y + tmp2;
     tmp3 = graycomatrix(squeeze(data(:,i,:)),'Offset', [-d -d],'NumLevels', 256,'GrayLimits',[]);
     angle135y = angle135y + tmp3;
end
warning('on','all')
end