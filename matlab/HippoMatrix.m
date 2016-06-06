function [hippoBox] = HippoMatrix(x, var, leftright)

load(x);

if (strcmp(leftright, 'left') == 1)
    tmp = 1;
elseif (strcmp(leftright, 'right') == 1)
    tmp = 2;
else
    disp('ERROR: Input needs to be left or right. STOPPING FUNCTION')
    return;
end

if (strcmp(var,'noterode') == 1)
    sum_of_1 = size(find(segmentation == tmp),1);
    left = zeros(sum_of_1,4);
    
elseif (strcmp(var,'erode') == 1)
   [xx,yy,zz] = ndgrid(-1:1);
    nhood = sqrt(xx.^2 + yy.^2 + zz.^2) <= 1.0;
    segmentation = imerode(segmentation, nhood);
    % SE = strel('diamond', 1);
    % segErode = imerode(segmentation, SE);
    %sum_of_1 = size(find(segmentation == 1),1);
    %sum_of_2 = size(find(segmentation == 2),1);

    sum_of_1 = size(find(segmentation == tmp),1);
    %sum_of_2_erode = size(find(segErode ==2),1);
    %Procent = [sum_of_1_erode / sum_of_1 sum_of_2_erode / sum_of_2];
    
    

    left = zeros(sum_of_1,4);
else
    disp('ERROR: Input needs to be normal or erode. STOPPING FUNCTION')
    return;
end
    
    
counter1 = 0;
for i = 1:256
     for j = 1:256
         for k = 1:256
             if segmentation(i, j, k) == tmp;
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