function [C_xPy] = C_xplusy(my_glcm, k)

C_xPy = 0;
for i=2:k
    C_xPy = C_xPy + my_glcm(i-1,k-i+1);
end
