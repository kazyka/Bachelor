function [hippoBox] = LeftHippoMatrixOLD(x)

load(x);

left = [];
counter1 = 0;
for i = 1:256
     for j = 1:256
         for k = 1:256
             if segmentation(i, j, k) == 1;
                 left = [left; [i j k];];
                 counter1 = counter1 + 1;
             end
         end
     end
end

minI = min(left(:,1));
minJ = min(left(:,2));
minK = min(left(:,3));
maxI = max(left(:,1));
maxJ = max(left(:,2));
maxK = max(left(:,3));
hippoBox = NaN((maxI - minI+1), (maxJ - minJ+1), (maxK - minK+1), 'double');

for i = 1:length(left)
    tmp = mri(left(i,1),left(i,2),left(i,3));
    hippoBox(left(i,1)+1-minI, left(i,2)+1-minJ, left(i,3)+1-minK) = tmp;
end