data = LeftHippoMatrix('7.mat');
%data(isnan(data)) = 0;
%sum1 = find(data == 1);
gsl = 256;
glcm = GLCM2D('7.mat',1);
aaa = sum(sum(glcm.GLCM2dDist{1}));
angle0x = zeros(256,256);
d = 1;
error = 200;
warning('off','all')
for i = 1:size(data,1);
     if size(find(isnan(data(i,:,:)) == 0),1) > 1
     tmp = graycomatrix(squeeze(data(i,:,:)),'Offset', [0 d],'NumLevels', 256);
        if tmp(1,1) > 0
            error = i;
        end
     angle0x = angle0x + tmp;
     end

end
tmp1 = zeros(256,256);
tmp1 = graycomatrix(squeeze(data(15,:,:)),'Offset', [0 d],'NumLevels', 256);
dataset = data(15,:,:);
ones = find(dataset == 1);
warning('on','all')
test1 = min(min(data));

Ck_xplusy = zeros(2*gsl,1);
for i = 2:(2*gsl)
    Ck_xplusy(i) = C_xplusy(glcm.angle0x, i);
end

my_sa2 = 0;
for i = 2:(2*gsl)
    my_sa2 = my_sa2 + i*Ck_xplusy(glcm, i);
end

my_sa = 0;
for i = 2:(2*gsl)
    my_sa = my_sa + i*Ck_xplusy(i);
end