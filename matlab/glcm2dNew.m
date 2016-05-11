function glcm2d = glcm2dNew(data, distance)
DATA = LeftHippoMatrix(data);
glcm2d = cell(12*distance,1);
for i = 1:distance
    [glcm2dx, glcm2dy, glcm2dz] = glcm2DxNew(DATA,i);
    glcm2d{((i-1)*12)+1} = glcm2dx(:,:,1);
    glcm2d{((i-1)*12)+2} = glcm2dx(:,:,2);
    glcm2d{((i-1)*12)+3} = glcm2dx(:,:,3);
    glcm2d{((i-1)*12)+4} = glcm2dx(:,:,4);
    glcm2d{((i-1)*12)+5} = glcm2dy(:,:,1);
    glcm2d{((i-1)*12)+6} = glcm2dy(:,:,2);
    glcm2d{((i-1)*12)+7} = glcm2dy(:,:,3);
    glcm2d{((i-1)*12)+8} = glcm2dy(:,:,4);
    glcm2d{((i-1)*12)+9} = glcm2dz(:,:,1);
    glcm2d{((i-1)*12)+10} = glcm2dz(:,:,2);
    glcm2d{((i-1)*12)+11} = glcm2dz(:,:,3);
    glcm2d{((i-1)*12)+12} = glcm2dz(:,:,4);
end