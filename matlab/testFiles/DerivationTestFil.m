hej = dataexection(1,1);
hej2 = dataexecutionTest(1,1);
%hej3 = dataexecutionTest(1,1);

glcm = glcm2dFast(LeftHippoMatrix('1.mat','normal'),10);

tic;
my_glcm = glcm{1}./sum(sum(glcm{1}));


nGrayLevels = size(my_glcm, 1);

cX = zeros(nGrayLevels, 1);    %Vil typisk være 256x1
cY = zeros(nGrayLevels, 1);    %Vil typisk være 256x1
cXplusY = zeros((nGrayLevels*2-1),1);   %Vil typisk være 511x1, da i=2:512
cXminusY = zeros(nGrayLevels,1);            %Vil typisk være 256x1
toc;

tic;

tmpsub = 1:256*256;
%The ind2sub command determines the equivalent 
%subscript values corresponding to a single index into an array.
% Get row and column subscripts of GLCM.  These subscripts correspond to the
% pixel values in the GLCM.
[I, J] = ind2sub([256,256],tmpsub);
toc;

tic;
%Doing the GLCM Features
tmpGLCM = my_glcm(:,:); 
cX(:) = sum(tmpGLCM,2);
cY(:) = sum(tmpGLCM,1);
tmpcXpY = [(I+J)' tmpGLCM(tmpsub)'];
tmpcXmY = [abs((I-J))' tmpGLCM(tmpsub)'];
for i = 2:2*nGrayLevels
    cXplusY(i-1,1) = sum(tmpcXpY(tmpcXpY(:,1)==i,2));
end
for i = 0:nGrayLevels-1
    cXminusY(i+1,1) = sum(tmpcXmY(tmpcXmY(:,1)==i,2));
end

toc;



tic;
%Doing the GLCM Features
%tmpGLCM = my_glcm(:,:); 
cX(:) = sum(my_glcm,2);
cY(:) = sum(my_glcm,1);
toc;

tic;
tmpcXpY = [(I+J)' my_glcm(tmpsub)'];
for i = 2:2*nGrayLevels
    cXplusY(i-1,1) = sum(tmpcXpY(tmpcXpY(:,1)==i,2));
end
toc;


tic;
CV_xplusy = zeros(512,1);
for i = 2:512
    CV_xplusy(i) = C_xplusy(my_glcm,i);
end
toc;


tic;
tmpcXmY = [abs((I-J))' my_glcm(tmpsub)'];
for i = 0:nGrayLevels-1
    cXminusY(i+1,1) = sum(tmpcXmY(tmpcXmY(:,1)==i,2));
end

toc;



tic;
%Vector for C_xminusy(indgang 1 svarer til k = 0, så i-1 = k)
CV_xminusy = zeros(256,1);
for i = 0:255
    CV_xminusy(i+1) = C_xminusy(my_glcm,i);
end
toc;

isequal(CV_xminusy,cXminusY)









