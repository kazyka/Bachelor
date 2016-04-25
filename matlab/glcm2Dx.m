function [out] = glcm2Dx(data, d)
out.angle0x = zeros(256,256);
out.angle45x = zeros(256,256);
out.angle90x = zeros(256,256);
out.angle135x = zeros(256,256);
warning('off','all')
for i = 1:size(data,1);
     if size(find(isnan(data(i,:,:)) == 0),1) > 1
         tmp = graycomatrix(squeeze(data(i,:,:)),'Offset', [0 d],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle0x = out.angle0x + tmp;
         tmp1 = graycomatrix(squeeze(data(i,:,:)),'Offset', [-d d],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle45x = out.angle45x + tmp1;
         tmp2 = graycomatrix(squeeze(data(i,:,:)),'Offset', [-d 0],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle90x = out.angle90x + tmp2;
         tmp3 = graycomatrix(squeeze(data(i,:,:)),'Offset', [-d -d],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle135x = out.angle135x + tmp3;
     end
end
warning('on','all')
end