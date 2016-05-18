function [anglex, angley, anglez] = glcm2DallAngles(data, d)
offsets = [0 d; -d d;-d 0;-d -d];
anglex = zeros(256,256,4);
angley = zeros(256,256,4);
anglez = zeros(256,256,4);
warning('off','all')
for i = 1:size(data,1);
    tmp0 = graycomatrix(squeeze(data(i,:,:)),'Offset', offsets,'NumLevels', 256, 'GrayLimits', [0 256]);
    anglex(:,:,1) = anglex(:,:,1) + tmp0(:,:,1);
    anglex(:,:,2) = anglex(:,:,2) + tmp0(:,:,2);
    anglex(:,:,3) = anglex(:,:,3) + tmp0(:,:,3);
    anglex(:,:,4) = anglex(:,:,4) + tmp0(:,:,4);
end
for i = 1:size(data,2);
    tmp0 = graycomatrix(squeeze(data(:,i,:)),'Offset', offsets,'NumLevels', 256, 'GrayLimits', [0 256]);
    angley(:,:,1) = angley(:,:,1) + tmp0(:,:,1);
    angley(:,:,2) = angley(:,:,2) + tmp0(:,:,2);
    angley(:,:,3) = angley(:,:,3) + tmp0(:,:,3);
    angley(:,:,4) = angley(:,:,4) + tmp0(:,:,4);
end
for i = 1:size(data,3);
    tmp0 = graycomatrix(squeeze(data(:,:,i)),'Offset', offsets,'NumLevels', 256, 'GrayLimits', [0 256]);
    anglez(:,:,1) = anglez(:,:,1) + tmp0(:,:,1);
    anglez(:,:,2) = anglez(:,:,2) + tmp0(:,:,2);
    anglez(:,:,3) = anglez(:,:,3) + tmp0(:,:,3);
    anglez(:,:,4) = anglez(:,:,4) + tmp0(:,:,4);
end
warning('on','all')
end