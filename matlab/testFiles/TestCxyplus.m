k = 500;
Values = [];
for i = 1:256
    for j = 1:256
        if(i+j == k)
            Values = [Values; [i j ];];
        end
    end
end
Values = Values'

A = ones(256);
CxplusyTest = C_xplusy(A,k);