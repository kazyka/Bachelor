ConDeri = load('C:\Users\Mathias\Desktop\Bachlor(dat)\Bachelor\matlab\CONTROL\datafileCO7.mat');
DataBox = LeftHippoMatrix('12.mat');
glcm = GLCM2D('12.mat',10);
A = cell(10,1);
for i=1:10
   A{i} = derivations(glcm.GLCM2dDist{1+(i-1)*12},256);
end

test = A{1}.my_asm;
B = zeros(10,1);
for i = 1:10
    B(i) = A{i}.my_asm;
end
figure
plot(B,'- .k');

%GLCM angle 0 i plan x distance 1, sammenligninger
warning('off','all')
sum12 = 0;
sum24 = 0;
C = cell(29,3);
for i=1:size(DataBox,1)
    tmp = graycomatrix(squeeze(DataBox(i,:,:)),'Offset', [0 1],'NumLevels', 256, 'GrayLimits', [0 256]);
    tmp1 = max(max(tmp));
    tmp2 = sum(sum(tmp));
    C{i,1} = tmp;
    C{i,2} = tmp1;
    C{i,3} = tmp2;
    sum12 = tmp2+sum12;
end
%Max 7 i en indgang pr slice, max 407 indgange i et slice, sker i samme
%slice
%Tester mod en anden kontrol patient (patient 24)
DataBox1 = LeftHippoMatrix('24.mat');
warning('off','all')
D = cell(29,3);
for i=1:size(DataBox1,1)
    tmp = graycomatrix(squeeze(DataBox1(i,:,:)),'Offset', [0 1],'NumLevels', 256, 'GrayLimits', [0 256]);
    tmp1 = max(max(tmp));
    tmp2 = sum(sum(tmp));
    D{i,1} = tmp;
    D{i,2} = tmp1;
    D{i,3} = tmp2;
    sum24 = tmp2+sum24;
end
sumdiffe = sum12-sum24;
%Max 6 i en indgang pr slice, sker 3 gange, max 252 indgange i et slice, sker i samme
%slice som en af 6 indgangene
%Total forskel indgange 2204, ca 66% flere indgange i patient 12 end 24




