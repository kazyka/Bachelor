function [hippoBox] = LeftHippoMatrix(x)

load(x);

sum_of_1 = size(find(segmentation == 1),1);

left = zeros(sum_of_1,4);
counter1 = 0;
for i = 1:256
     for j = 1:256
         for k = 1:256
             if segmentation(i, j, k) == 1;
                 counter1 = counter1 + 1;
                 left(counter1,1) = i;
                 left(counter1,2) = j;
                 left(counter1,3) = k;
                 left(counter1,4) = mri(i,j,k);
             end
         end
     end
end
minimum = min(left);
maximum = max(left);
minI = minimum(1,1);
minJ = minimum(1,2);
minK = minimum(1,3);
maxI = maximum(1,1);
maxJ = maximum(1,2);
maxK = maximum(1,3);
hippoBox = NaN((maxI - minI+1), (maxJ - minJ+1), (maxK - minK+1), 'double');

for i = 1:sum_of_1
    hippoBox(left(i,1)+1-minI, left(i,2)+1-minJ, left(i,3)+1-minK) = left(i,4);
end