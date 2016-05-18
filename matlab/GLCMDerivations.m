function stats = GLCMDerivations(glcm)


% Normalize the GLCM
glcm = glcm./sum(glcm(:));


%Finding the size of the glcm aka graylevels
nGrayLevels = size(glcm, 1);

cX = zeros(nGrayLevels, 1);    %Vil typisk være 256x1
cY = zeros(nGrayLevels, 1);    %Vil typisk være 256x1
cXplusY = zeros((nGrayLevels*2-1),1);   %Vil typisk være 511x1, da i=2:512
cXminusY = zeros(nGrayLevels,1);            %Vil typisk være 256x1


% s = size(glcm);
% [c, r] = meshgrid(1:s(1), 1:s(2));
% r = r(:);
% c = c(:);
tmpsub = 1:nGrayLevels*nGrayLevels;
%The ind2sub command determines the equivalent 
%subscript values corresponding to a single index into an array.
% Get row and column subscripts of GLCM.  These subscripts correspond to the
% pixel values in the GLCM.
[I, J] = ind2sub([nGrayLevels,nGrayLevels],tmpsub);


%Doing the GLCM Features
tmpGLCM = glcm(:,:); 

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

muX = mean(cX);
muY = mean(cY);
stdX = std(cX);
stdY = std(cY);

HXY1 = -nansum(tmpGLCM(tmpsub)'.*log(cX(I).*cY(J))); 
HXY2 = -nansum(cX(I).*cY(J).*log(cX(I).*cY(J)));
HX   = -nansum(cX.*log(cX));
HY   = -nansum(cY.*log(cY));
HXY  = -nansum(tmpGLCM(:).*log(tmpGLCM(:)));



stats.angularSecondMoment                = sum(tmpGLCM(:).^2);
stats.contrast                           = sum(abs(I-J).^2.*tmpGLCM(tmpsub));
stats.correlation                        = (sum(I.*J.*tmpGLCM(tmpsub)) - muX*muY) ./ (stdX*stdY);  
stats.variance                           = sum(((I - mean(tmpGLCM(:))).^2).*tmpGLCM(tmpsub));
stats.inverseDifferenceMoment            = sum(tmpGLCM(tmpsub)./(1 + (I-J).^2));
stats.sumAverage                         = sum(bsxfun(@times,(2:2*nGrayLevels)',cXplusY));
stats.sumVariance                        = sum(((2:2*nGrayLevels) - stats.sumAverage)'.^2.*cXplusY((2:2*nGrayLevels)-1,1));
stats.sumEntropy                         = nansum(cXplusY.*log(cXplusY));
stats.entropy                            = HXY;
stats.differenceVariance                 = var(cXminusY);
stats.differenceEntropy                  = nansum(cXminusY.*log(cXminusY));
stats.informationMeasuresOfCorrelation1  = (HXY - HXY1)./(max(HX,HY));
stats.informationMeasuresOfCorrelation2  = sqrt(1-exp(-2.*(HXY2 - HXY)));


end

    