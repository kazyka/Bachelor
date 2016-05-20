function glcm2d = glcm2dFast(data, distance)

glcm2d = cell(9*distance,1);
for i = 1:distance
    [glcm2dx, glcm2dy, glcm2dz] = glcm2DallAngles(data,i);
    glcm2d{((i-1)*9)+1} = glcm2dx(:,:,1);
    glcm2d{((i-1)*9)+2} = glcm2dx(:,:,2);
    glcm2d{((i-1)*9)+3} = glcm2dx(:,:,3);
    glcm2d{((i-1)*9)+4} = glcm2dx(:,:,4);
    %glcm2d{((i-1)*12)+5} = glcm2dy(:,:,1); Anglex0 is equal to Angley0
    %removing this one
    glcm2d{((i-1)*9)+5} = glcm2dy(:,:,2);
    glcm2d{((i-1)*9)+6} = glcm2dy(:,:,3);
    glcm2d{((i-1)*9)+7} = glcm2dy(:,:,4);
    %glcm2d{((i-1)*12)+9} = glcm2dz(:,:,1); Anglex90 is equal to
    %transpoed anglez45 removing this one
    glcm2d{((i-1)*9)+8} = glcm2dz(:,:,2);
    %glcm2d{((i-1)*12)+11} = glcm2dz(:,:,3); Angley45 is equal to Anglez90
    %removing this one
    glcm2d{((i-1)*9)+9} = glcm2dz(:,:,4);
end


%1 = 5, 7 = 11, 3 = T(9), removed the latter