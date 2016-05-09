function [out] = glcm2Dz(data, d)
out.angle0z = zeros(256,256);
out.angle45z = zeros(256,256);
out.angle90z = zeros(256,256);
out.angle135z = zeros(256,256);
warning('off','all')
for i = 1:size(data,3);
    if size(find(isnan(data(:,:,i)) == 0),1) > 1
         tmp = graycomatrix(data(:,:,i),'Offset', [0 d],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle0z = out.angle0z + tmp;
         tmp1 = graycomatrix(data(:,:,i),'Offset', [-d d],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle45z = out.angle45z + tmp1;
         tmp2 = graycomatrix(data(:,:,i),'Offset', [-d 0],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle90z = out.angle90z + tmp2;
         tmp3 = graycomatrix(data(:,:,i),'Offset', [-d -d],'NumLevels', 256, 'GrayLimits', [0 256]);
         out.angle135z = out.angle135z + tmp3;
    end
end
warning('on','all')
end