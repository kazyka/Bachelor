function [C_xMy] = C_xminusy(my_glcm, k)
N = 256;
C_xMy = 0;
if k == 0
    for i = 1:256
        C_xMy = C_xMy + my_glcm(i,i);
    end
else
    for i = 1:(N-k)
        C_xMy = C_xMy + my_glcm(i, k+i) + my_glcm(k+i, i);
    end
end

