function [C_xPy] = C_xplusy(my_glcm, k)
<<<<<<< HEAD

i = 1;
j = 1;
N = 256;
C_xPy = 0;

if (k > N)
    for i = (k-N):N
        for j = N:(k-N)
            C_xPy = C_xPy + my_glcm(i, j);
        end
    end
else
    for i = 1:(k-1)
        for j = (k-i):1
            C_xPy = C_xPy + my_glcm(i, j);
        end
    end
end
=======
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
>>>>>>> origin/master
