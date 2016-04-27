
lefthippo1 = LeftHippoMatrix('12.mat');
lefthippo2 = LeftHippoMatrixErode('12.mat');


%GLCM angle 0 i plan x distance 1, sammenligninger
warning('off','all')
sum1 = 0;
sumErode = 0;
C = cell(size(lefthippo1,1),3);
for i=1:size(lefthippo1,1)
    tmp = graycomatrix(squeeze(lefthippo1(i,:,:)),'Offset', [0 1],'NumLevels', 256, 'GrayLimits', [0 256]);
    tmp1 = max(max(tmp));
    tmp2 = sum(sum(tmp));
    C{i,1} = tmp;
    C{i,2} = tmp1;
    C{i,3} = tmp2;
    sum1 = tmp2+sum1;
end
oldGlcm = glcm2Dx(lefthippo1,1);
OldDeri = derivations(oldGlcm.angle0x,256);

DataBox1 = LeftHippoMatrix('24.mat');
warning('off','all')
D = cell(size(lefthippo2,1),3);
for i=1:size(lefthippo2,1)
    tmp = graycomatrix(squeeze(lefthippo2(i,:,:)),'Offset', [0 1],'NumLevels', 256, 'GrayLimits', [0 256]);
    tmp1 = max(max(tmp));
    tmp2 = sum(sum(tmp));
    D{i,1} = tmp;
    D{i,2} = tmp1;
    D{i,3} = tmp2;
    sumErode = tmp2+sumErode;
end
sumzdiffe = sum1-sumErode;
newGlcm = glcm2Dx(lefthippo2,1);
newDeri = derivations(newGlcm.angle0x,256);



% glcm = GLCM2D('12.mat',10);
% A = cell(10,1);
% for i=1:10
%    A{i} = derivations(glcm.GLCM2dDist{1+(i-1)*12},256);
% end
% 
% test = A{1}.my_asm;
% B = zeros(10,1);
% for i = 1:10
%     B(i) = A{i}.my_asm;
% end
% figure
% plot(B,'- .k');



