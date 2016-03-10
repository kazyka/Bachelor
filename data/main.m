load('1.mat');

left = [];
right = [];
tmpmin = 1;
tmpmax = 0;
printvar = [0 0 0 0];
counter0 = 0;
counter1 = 0;
counter2 = 0;
 for i = 1:256
     for j = 1:256
         for k = 1:256
%              if segmentation(i, j, k) == 0;
%                  %printvar = [1, i, j ,k];
%                  %disp(printvar);
%                  counter0 = counter0 + 1;
%              end
             if segmentation(i, j, k) == 1;
                 %printvar = [1, i, j ,k];
                 %disp(printvar);
                 left = [left; [i j k];];
                 counter1 = counter1 + 1;
             end
%              if segmentation(i, j, k) == 2;
%                  %printvar = [1, i, j ,k];
%                  %disp(printvar);
%                  right = [right i j k];
%                  counter2 = counter2 + 1;
%              end
         end
     end
 end
 LeftVal = [];
for i = 1:length(left) 
    coordi = left(i,1);
    coordj = left(i,2);
    coordk = left(i,3);
    LeftVal = [LeftVal; mri(coordi, coordj, coordk);];
end
% Forrest:
% venstrenede min i, min j, min k
% venstreoppe min i, max j, min k
% højrenede   max i, min j, min k
% højreoppe   max i, max j, min k
% 
% Bagerst:
% venstrenede min i, min j, max k
% venstreoppe min i, max j, max k
% højrenede   max i, min j, max k
% højreoppe   max i, max j, max k
minI = min(left(:,1));
minJ = min(left(:,2));
minK = min(left(:,3));
maxI = max(left(:,1));
maxJ = max(left(:,2));
maxK = max(left(:,3));



%billeder
imagesc(imfuse(mri(:,:,160),segmentation(:,:,160),'blend'))
