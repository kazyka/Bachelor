function [out] = glcm2Dy(data, d)
out.angle0y = zeros(256,256);
out.angle45y = zeros(256,256);
out.angle90y = zeros(256,256);
out.angle135y = zeros(256,256);
warning('off','all')
for i = 1:size(data,2);
    if size(find(isnan(data(:,i,:)) == 0),1) > 1 
         tmp = graycomatrix(squeeze(data(:,i,:)),'Offset', [0 d],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle0y = out.angle0y + tmp;
         tmp1 = graycomatrix(squeeze(data(:,i,:)),'Offset', [-d d],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle45y = out.angle45y + tmp1;
         tmp2 = graycomatrix(squeeze(data(:,i,:)),'Offset', [-d 0],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle90y = out.angle90y + tmp2;
         tmp3 = graycomatrix(squeeze(data(:,i,:)),'Offset', [-d -d],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle135y = out.angle135y + tmp3;
    end
end
warning('on','all')
end