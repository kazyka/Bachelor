function [C_xPy] = C_xplusy(my_glcm, k)
N = 256;
C_xPy = 0;
if k <= N
    for i=2:k
            C_xPy = C_xPy + my_glcm(i-1,k-i+1);
    end
else
   for i = k-N:N
        C_xPy = C_xPy + my_glcm(i,k-i);
   end
end
